module rhythm_pcie (
    input SYSCLK_P,
    input SYSCLK_N,
    
    input  PCIE_PERST_B_LS,
   input  PCIE_REFCLK_N,
   input  PCIE_REFCLK_P,
   input [7:0] PCIE_RX_N,
   input [7:0] PCIE_RX_P,
   output [3:0] GPIO_LED,
   output [7:0] PCIE_TX_N,
   output [7:0] PCIE_TX_P,
    
    input MISO_C1,
    input MISO_C2,
    output MOSI_C,
    output SCLK_C,
    output CS_C
);

    wire 				clk1;				// buffered 100 MHz clock
	wire				dataclk;			// programmable frequency clock (f = 2800 * per-channel amplifier sampling rate)
	wire				dataclk_locked, PLL_prog_done;
	
	reg [15:0]		FIFO_data_in;
    reg                FIFO_write_to;
    wire [31:0]     FIFO_data_out;
    wire                FIFO_read_from;
    wire [31:0]     num_words_in_FIFO;
    
    wire [9:0]		RAM_addr_wr;
    reg [9:0]        RAM_addr_rd;
    wire [3:0]        RAM_bank_sel_wr;
    reg [3:0]        RAM_bank_sel_rd;
    wire [15:0]        RAM_data_in;
    wire [15:0]        RAM_data_out_1_pre, RAM_data_out_2_pre, RAM_data_out_3_pre;
    reg [15:0]        RAM_data_out_1, RAM_data_out_2, RAM_data_out_3;
    wire                RAM_we_1, RAM_we_2, RAM_we_3;
        
    reg [5:0]         channel, channel_MISO;  // varies from 0-34 (amplfier channels 0-31, plus 3 auxiliary commands)
    reg [15:0]         MOSI_cmd_A, MOSI_cmd_B, MOSI_cmd_C, MOSI_cmd_D;
    
    reg [73:0]         in4x_A1, in4x_A2;
    reg [73:0]         in4x_B1, in4x_B2;
    reg [73:0]         in4x_C1, in4x_C2;
    reg [73:0]         in4x_D1, in4x_D2;
    wire [15:0]     in_A1, in_A2;
    wire [15:0]     in_B1, in_B2;
    wire [15:0]     in_C1, in_C2;
    wire [15:0]     in_D1, in_D2;
    wire [15:0]     in_DDR_A1, in_DDR_A2;
    wire [15:0]     in_DDR_B1, in_DDR_B2;
    wire [15:0]     in_DDR_C1, in_DDR_C2;
    wire [15:0]     in_DDR_D1, in_DDR_D2;
    
    reg [3:0]         delay_A, delay_B, delay_C, delay_D;
    
    reg [15:0]         result_A1, result_A2;
    reg [15:0]         result_B1, result_B2;
    reg [15:0]         result_C1, result_C2;
    reg [15:0]         result_D1, result_D2;
    reg [15:0]         result_DDR_A1, result_DDR_A2;
    reg [15:0]         result_DDR_B1, result_DDR_B2;
    reg [15:0]         result_DDR_C1, result_DDR_C2;
    reg [15:0]         result_DDR_D1, result_DDR_D2;

    reg [31:0]         timestamp;             
    reg [31:0]        max_timestep;
    reg [31:0]        max_timestep_in;
    wire [31:0]     data_stream_timestamp;
    wire [63:0]        header_magic_number;
    wire [15:0]        data_stream_filler;
    
    reg [15:0]        data_stream_1, data_stream_2, data_stream_3, data_stream_4;
    reg [15:0]        data_stream_5, data_stream_6, data_stream_7, data_stream_8;
    reg [15:0]        data_stream_9, data_stream_10, data_stream_11, data_stream_12;
    reg [15:0]        data_stream_13, data_stream_14, data_stream_15, data_stream_16;
    reg [3:0]        data_stream_1_sel, data_stream_2_sel, data_stream_3_sel, data_stream_4_sel;
    reg [3:0]        data_stream_5_sel, data_stream_6_sel, data_stream_7_sel, data_stream_8_sel;
    reg [3:0]        data_stream_9_sel, data_stream_10_sel, data_stream_11_sel, data_stream_12_sel;
    reg [3:0]        data_stream_13_sel, data_stream_14_sel, data_stream_15_sel, data_stream_16_sel;
    reg [3:0]        data_stream_1_sel_in, data_stream_2_sel_in, data_stream_3_sel_in, data_stream_4_sel_in;
    reg [3:0]        data_stream_5_sel_in, data_stream_6_sel_in, data_stream_7_sel_in, data_stream_8_sel_in;
    reg [3:0]        data_stream_9_sel_in, data_stream_10_sel_in, data_stream_11_sel_in, data_stream_12_sel_in;
    reg [3:0]        data_stream_13_sel_in, data_stream_14_sel_in, data_stream_15_sel_in, data_stream_16_sel_in;
    reg                data_stream_1_en, data_stream_2_en, data_stream_3_en, data_stream_4_en;
    reg                data_stream_5_en, data_stream_6_en, data_stream_7_en, data_stream_8_en;
    reg                data_stream_9_en, data_stream_10_en, data_stream_11_en, data_stream_12_en;
    reg                data_stream_13_en, data_stream_14_en, data_stream_15_en, data_stream_16_en;
    reg                data_stream_1_en_in, data_stream_2_en_in, data_stream_3_en_in, data_stream_4_en_in;
    reg                data_stream_5_en_in, data_stream_6_en_in, data_stream_7_en_in, data_stream_8_en_in;
    reg                data_stream_9_en_in, data_stream_10_en_in, data_stream_11_en_in, data_stream_12_en_in;
    reg                data_stream_13_en_in, data_stream_14_en_in, data_stream_15_en_in, data_stream_16_en_in;
    
    reg [15:0]        data_stream_TTL_in, data_stream_TTL_out;
    wire [15:0]        data_stream_ADC_1, data_stream_ADC_2, data_stream_ADC_3, data_stream_ADC_4;
    wire [15:0]        data_stream_ADC_5, data_stream_ADC_6, data_stream_ADC_7, data_stream_ADC_8;
    
    wire                TTL_out_mode;
    reg [15:0]        TTL_out_user;
    
    wire                reset, SPI_start;
    reg                  SPI_run_continuous;
    wire               hard_reset;
    reg                soft_reset = 1'b0;
    reg                SPI_running;

    reg [3:0]         dataclk_D;      
    reg [6:0]         dataclk_M;
    reg [7:0]         dataclk_O;
    
    wire                DCM_prog_trigger;
    reg           DSP_settle;

    wire [15:0]     MOSI_cmd_selected_A, MOSI_cmd_selected_B, MOSI_cmd_selected_C, MOSI_cmd_selected_D;

    reg [15:0]         aux_cmd_A, aux_cmd_B, aux_cmd_C, aux_cmd_D;
    reg [9:0]         aux_cmd_index_1, aux_cmd_index_2, aux_cmd_index_3;
    reg [9:0]         max_aux_cmd_index_1_in, max_aux_cmd_index_2_in, max_aux_cmd_index_3_in;
    reg [9:0]         max_aux_cmd_index_1, max_aux_cmd_index_2, max_aux_cmd_index_3;
    reg [9:0]        loop_aux_cmd_index_1, loop_aux_cmd_index_2, loop_aux_cmd_index_3;

    reg [3:0]         aux_cmd_bank_1_A_in, aux_cmd_bank_1_B_in, aux_cmd_bank_1_C_in, aux_cmd_bank_1_D_in;
    reg [3:0]         aux_cmd_bank_2_A_in, aux_cmd_bank_2_B_in, aux_cmd_bank_2_C_in, aux_cmd_bank_2_D_in;
    reg [3:0]         aux_cmd_bank_3_A_in, aux_cmd_bank_3_B_in, aux_cmd_bank_3_C_in, aux_cmd_bank_3_D_in;
    reg [3:0]         aux_cmd_bank_1_A, aux_cmd_bank_1_B, aux_cmd_bank_1_C, aux_cmd_bank_1_D;
    reg [3:0]         aux_cmd_bank_2_A, aux_cmd_bank_2_B, aux_cmd_bank_2_C, aux_cmd_bank_2_D;
    reg [3:0]         aux_cmd_bank_3_A, aux_cmd_bank_3_B, aux_cmd_bank_3_C, aux_cmd_bank_3_D;

    wire [4:0]         DAC_channel_sel_1, DAC_channel_sel_2, DAC_channel_sel_3, DAC_channel_sel_4;
    wire [4:0]         DAC_channel_sel_5, DAC_channel_sel_6, DAC_channel_sel_7, DAC_channel_sel_8;
    wire [4:0]         DAC_stream_sel_1, DAC_stream_sel_2, DAC_stream_sel_3, DAC_stream_sel_4;
    wire [4:0]         DAC_stream_sel_5, DAC_stream_sel_6, DAC_stream_sel_7, DAC_stream_sel_8;
    wire                 DAC_en_1, DAC_en_2, DAC_en_3, DAC_en_4;
    wire                 DAC_en_5, DAC_en_6, DAC_en_7, DAC_en_8;
    reg [15:0]        DAC_pre_register_1, DAC_pre_register_2, DAC_pre_register_3, DAC_pre_register_4;
    reg [15:0]        DAC_pre_register_5, DAC_pre_register_6, DAC_pre_register_7, DAC_pre_register_8;
    reg [15:0]        DAC_register_1, DAC_register_2, DAC_register_3, DAC_register_4;
    reg [15:0]        DAC_register_5, DAC_register_6, DAC_register_7, DAC_register_8;

    reg [15:0]        DAC_manual;
    wire [6:0]     DAC_noise_suppress;
    wire [2:0]        DAC_gain;
    
    reg [15:0]        DAC_thresh_1, DAC_thresh_2, DAC_thresh_3, DAC_thresh_4;
    reg [15:0]        DAC_thresh_5, DAC_thresh_6, DAC_thresh_7, DAC_thresh_8;
    reg                DAC_thresh_pol_1, DAC_thresh_pol_2, DAC_thresh_pol_3, DAC_thresh_pol_4;
    reg                DAC_thresh_pol_5, DAC_thresh_pol_6, DAC_thresh_pol_7, DAC_thresh_pol_8;
    wire [7:0]        DAC_thresh_out;
    
    reg                HPF_en;
    reg [15:0]        HPF_coefficient;
    
    reg                external_fast_settle_enable;
    reg [3:0]        external_fast_settle_channel;
    reg                external_fast_settle, external_fast_settle_prev;

    reg                external_digout_enable_A, external_digout_enable_B, external_digout_enable_C, external_digout_enable_D;
    reg [3:0]        external_digout_channel_A, external_digout_channel_B, external_digout_channel_C, external_digout_channel_D;
    reg                external_digout_A, external_digout_B, external_digout_C, external_digout_D;
    
    //Xillybus stuff
      // Clock and quiesce
    wire  bus_clk;
    wire  quiesce;
  
  
    // Wires related to /dev/xillybus_auxcmd1_membank_16
    wire  user_w_auxcmd1_membank_16_wren;
    wire  user_w_auxcmd1_membank_16_full;
    wire [15:0] user_w_auxcmd1_membank_16_data;
    wire  user_w_auxcmd1_membank_16_open;
    wire [15:0] user_auxcmd1_membank_16_addr;
    wire  user_auxcmd1_membank_16_addr_update;
  
    // Wires related to /dev/xillybus_auxcmd2_membank_16
    wire  user_w_auxcmd2_membank_16_wren;
    wire  user_w_auxcmd2_membank_16_full;
    wire [15:0] user_w_auxcmd2_membank_16_data;
    wire  user_w_auxcmd2_membank_16_open;
    wire [15:0] user_auxcmd2_membank_16_addr;
    wire  user_auxcmd2_membank_16_addr_update;
  
    // Wires related to /dev/xillybus_auxcmd3_membank_16
    wire  user_w_auxcmd3_membank_16_wren;
    wire  user_w_auxcmd3_membank_16_full;
    wire [15:0] user_w_auxcmd3_membank_16_data;
    wire  user_w_auxcmd3_membank_16_open;
    wire [15:0] user_auxcmd3_membank_16_addr;
    wire  user_auxcmd3_membank_16_addr_update;
  
    // Wires related to /dev/xillybus_control_regs_16
    wire  user_r_control_regs_16_rden;
    wire  user_r_control_regs_16_empty;
    reg [15:0] user_r_control_regs_16_data;
    wire  user_r_control_regs_16_eof;
    wire  user_r_control_regs_16_open;
    wire  user_w_control_regs_16_wren;
    wire  user_w_control_regs_16_full;
    wire [15:0] user_w_control_regs_16_data;
    wire  user_w_control_regs_16_open;
    wire [4:0] user_control_regs_16_addr;
    wire  user_control_regs_16_addr_update;
  
    // Wires related to /dev/xillybus_neural_data_32
    wire  user_r_neural_data_32_rden;
    wire  user_r_neural_data_32_empty;
    wire [31:0] user_r_neural_data_32_data;
    wire  user_r_neural_data_32_eof;
    wire  user_r_neural_data_32_open;
  
    // Wires related to /dev/xillybus_status_regs_16
    wire  user_r_status_regs_16_rden;
    wire  user_r_status_regs_16_empty;
    reg [15:0] user_r_status_regs_16_data;
    wire  user_r_status_regs_16_eof;
    wire  user_r_status_regs_16_open;
    wire [4:0] user_status_regs_16_addr;
    wire  user_status_regs_16_addr_update;
    
    reg SPI_start_trigger;
    reg PLL_prog_trigger;
    
      
      assign hard_reset = ~user_w_control_regs_16_open; //system is kept in reset state until at least the control registers are opened 
      assign reset = soft_reset | hard_reset;
      
      //Control registers
      always @(posedge bus_clk or posedge reset)
      begin
          SPI_start_trigger <= 1'b0;
          PLL_prog_trigger <= 1'b0;
          if (reset)
          begin
            if (user_w_control_regs_16_wren && user_control_regs_16_addr == 5'h00) //allow exit soft-reset condition
                soft_reset <= user_w_control_regs_16_data[0];
            if (user_r_control_regs_16_rden)
            begin
                if (user_control_regs_16_addr == 5'h00) //return soft reset bit even in reset condition
                    user_r_control_regs_16_data <= {15'b0 , soft_reset};
                else
                    user_r_control_regs_16_data <= 16'b0;
            end 
          //Fill other reset conditions here   
          SPI_run_continuous <= 1'b0;
          DSP_settle <= 1'b0; 
          max_timestep_in <= 32'h80;
          delay_A <= 4'b0;
          delay_B <= 4'b0;
          delay_C <= 4'b0;
          delay_D <= 4'b0;
          
          aux_cmd_bank_1_A_in <= 4'b0;
          aux_cmd_bank_1_B_in <= 4'b0;
          aux_cmd_bank_1_C_in <= 4'b0;
          aux_cmd_bank_1_D_in <= 4'b0;
          
          aux_cmd_bank_2_A_in <= 4'b0;
          aux_cmd_bank_2_B_in <= 4'b0;
          aux_cmd_bank_2_C_in <= 4'b0;
          aux_cmd_bank_2_D_in <= 4'b0;
          
          aux_cmd_bank_3_A_in <= 4'b0;
          aux_cmd_bank_3_B_in <= 4'b0;
          aux_cmd_bank_3_C_in <= 4'b0;
          aux_cmd_bank_3_D_in <= 4'b0;
          
          max_aux_cmd_index_1_in <= 10'b0;
          max_aux_cmd_index_2_in <= 10'b0;
          max_aux_cmd_index_3_in <= 10'b0;
          loop_aux_cmd_index_1 <= 10'b0; 
          loop_aux_cmd_index_2 <= 10'b0;
          loop_aux_cmd_index_3 <= 10'b0;
          
          data_stream_1_sel_in <= 4'b0;
          data_stream_2_sel_in <= 4'b0;
          data_stream_3_sel_in <= 4'b0;
          data_stream_4_sel_in <= 4'b0;
          data_stream_5_sel_in <= 4'b0;
          data_stream_6_sel_in <= 4'b0;
          data_stream_7_sel_in <= 4'b0;
          data_stream_8_sel_in <= 4'b0;
          data_stream_9_sel_in <= 4'b0;
          data_stream_10_sel_in <= 4'b0;
          data_stream_11_sel_in <= 4'b0;
          data_stream_12_sel_in <= 4'b0;
          data_stream_13_sel_in <= 4'b0;
          data_stream_14_sel_in <= 4'b0;
          data_stream_15_sel_in <= 4'b0;
          data_stream_16_sel_in <= 4'b0;
          
          data_stream_1_en_in <= 1'b0;
          data_stream_2_en_in <= 1'b0;
          data_stream_3_en_in <= 1'b0;
          data_stream_4_en_in <= 1'b0;
          data_stream_5_en_in <= 1'b0;
          data_stream_6_en_in <= 1'b0;
          data_stream_7_en_in <= 1'b0;
          data_stream_8_en_in <= 1'b0;
          data_stream_9_en_in <= 1'b0;
          data_stream_10_en_in <= 1'b0;
          data_stream_11_en_in <= 1'b0;
          data_stream_12_en_in <= 1'b0;
          data_stream_13_en_in <= 1'b0;
          data_stream_14_en_in <= 1'b0;
          data_stream_15_en_in <= 1'b0;
          data_stream_16_en_in <= 1'b0;
          
          end
          else
          begin
            if (user_w_control_regs_16_wren)
            begin
                case(user_control_regs_16_addr)
                    5'h00:
                    begin
                        soft_reset <= user_w_control_regs_16_data[0];
                        SPI_run_continuous <= user_w_control_regs_16_data[1];
                        DSP_settle <= user_w_control_regs_16_data[2];
                    end
                    5'h01: max_timestep_in[15:0] <= user_w_control_regs_16_data;
                    5'h02: max_timestep_in[31:16] <= user_w_control_regs_16_data;
                    5'h03: 
                    begin
                        dataclk_O <= user_w_control_regs_16_data[7:0];
                        dataclk_M <= user_w_control_regs_16_data[14:8];
                        dataclk_D <= user_w_control_regs_16_data[15] ? 4'h08 : 4'h04;
                        PLL_prog_trigger <= 1'b1;
                    end
                    5'h04:
                    begin
                        delay_A <= user_w_control_regs_16_data[3:0];
                        delay_B <= user_w_control_regs_16_data[7:4];
                        delay_C <= user_w_control_regs_16_data[11:8];
                        delay_D <= user_w_control_regs_16_data[15:12];
                    end
                    5'h08:
                    begin
                        aux_cmd_bank_1_A_in <= user_w_control_regs_16_data[3:0];
                        aux_cmd_bank_1_B_in <= user_w_control_regs_16_data[7:4];
                        aux_cmd_bank_1_C_in <= user_w_control_regs_16_data[11:8];
                        aux_cmd_bank_1_D_in <= user_w_control_regs_16_data[15:12];
                    end
                    5'h09:
                    begin
                        aux_cmd_bank_2_A_in <= user_w_control_regs_16_data[3:0];
                        aux_cmd_bank_2_B_in <= user_w_control_regs_16_data[7:4];
                        aux_cmd_bank_2_C_in <= user_w_control_regs_16_data[11:8];
                        aux_cmd_bank_2_D_in <= user_w_control_regs_16_data[15:12];
                    end
                    5'h0A:
                    begin
                        aux_cmd_bank_3_A_in <= user_w_control_regs_16_data[3:0];
                        aux_cmd_bank_3_B_in <= user_w_control_regs_16_data[7:4];
                        aux_cmd_bank_3_C_in <= user_w_control_regs_16_data[11:8];
                        aux_cmd_bank_3_D_in <= user_w_control_regs_16_data[15:12];
                    end
                    5'h0B: max_aux_cmd_index_1_in <= user_w_control_regs_16_data[9:0];
                    5'h0C: max_aux_cmd_index_2_in <= user_w_control_regs_16_data[9:0];
                    5'h0D: max_aux_cmd_index_3_in <= user_w_control_regs_16_data[9:0];
                    5'h0E: loop_aux_cmd_index_1 <= user_w_control_regs_16_data[9:0]; 
                    5'h0F: loop_aux_cmd_index_2 <= user_w_control_regs_16_data[9:0];
                    5'h10: loop_aux_cmd_index_3 <= user_w_control_regs_16_data[9:0];
                    5'h12:
                    begin
                        data_stream_1_sel_in <= user_w_control_regs_16_data[3:0];
                        data_stream_2_sel_in <= user_w_control_regs_16_data[7:4];
                        data_stream_3_sel_in <= user_w_control_regs_16_data[11:8];
                        data_stream_4_sel_in <= user_w_control_regs_16_data[15:12];
                    end
                    5'h13:
                    begin
                        data_stream_5_sel_in <= user_w_control_regs_16_data[3:0];
                        data_stream_6_sel_in <= user_w_control_regs_16_data[7:4];
                        data_stream_7_sel_in <= user_w_control_regs_16_data[11:8];
                        data_stream_8_sel_in <= user_w_control_regs_16_data[15:12];
                    end
                    5'h14:
                    begin
                        data_stream_9_sel_in <= user_w_control_regs_16_data[3:0];
                        data_stream_10_sel_in <= user_w_control_regs_16_data[7:4];
                        data_stream_11_sel_in <= user_w_control_regs_16_data[11:8];
                        data_stream_12_sel_in <= user_w_control_regs_16_data[15:12];
                    end
                    5'h15:
                    begin
                        data_stream_13_sel_in <= user_w_control_regs_16_data[3:0];
                        data_stream_14_sel_in <= user_w_control_regs_16_data[7:4];
                        data_stream_15_sel_in <= user_w_control_regs_16_data[11:8];
                        data_stream_16_sel_in <= user_w_control_regs_16_data[15:12];
                    end
                    5'h16:
                        begin
                            data_stream_1_en_in <= user_w_control_regs_16_data[0];
                            data_stream_2_en_in <= user_w_control_regs_16_data[1];
                            data_stream_3_en_in <= user_w_control_regs_16_data[2];
                            data_stream_4_en_in <= user_w_control_regs_16_data[3];
                            data_stream_5_en_in <= user_w_control_regs_16_data[4];
                            data_stream_6_en_in <= user_w_control_regs_16_data[5];
                            data_stream_7_en_in <= user_w_control_regs_16_data[6];
                            data_stream_8_en_in <= user_w_control_regs_16_data[7];
                            data_stream_9_en_in <= user_w_control_regs_16_data[8];
                            data_stream_10_en_in <= user_w_control_regs_16_data[9];
                            data_stream_11_en_in <= user_w_control_regs_16_data[10];
                            data_stream_12_en_in <= user_w_control_regs_16_data[11];
                            data_stream_13_en_in <= user_w_control_regs_16_data[12];
                            data_stream_14_en_in <= user_w_control_regs_16_data[13];
                            data_stream_15_en_in <= user_w_control_regs_16_data[14];
                            data_stream_16_en_in <= user_w_control_regs_16_data[15];
                        end
                    5'h1F:
                        SPI_start_trigger <= user_w_control_regs_16_data[0];
                endcase
            end
            if (user_r_control_regs_16_rden)
                begin
                    case(user_control_regs_16_addr)
                        5'h00: user_r_control_regs_16_data <= {13'b0, DSP_settle, SPI_run_continuous, 1'b0};
                        5'h01: user_r_control_regs_16_data <= max_timestep_in[15:0];
                        5'h02: user_r_control_regs_16_data <= max_timestep_in[31:16];
                        5'h03: user_r_control_regs_16_data <= {dataclk_D[3], dataclk_M, dataclk_O};
                        5'h04: user_r_control_regs_16_data <= {delay_D, delay_C, delay_B, delay_A};
                        5'h08: user_r_control_regs_16_data <= {aux_cmd_bank_1_D_in, aux_cmd_bank_1_C_in, aux_cmd_bank_1_B_in, aux_cmd_bank_1_A_in};
                        5'h09: user_r_control_regs_16_data <= {aux_cmd_bank_2_D_in, aux_cmd_bank_2_C_in, aux_cmd_bank_2_B_in, aux_cmd_bank_2_A_in};
                        5'h0A: user_r_control_regs_16_data <= {aux_cmd_bank_3_D_in, aux_cmd_bank_3_C_in, aux_cmd_bank_3_B_in, aux_cmd_bank_3_A_in};
                        5'h0B: user_r_control_regs_16_data <= {6'b0, max_aux_cmd_index_1_in};
                        5'h0C: user_r_control_regs_16_data <= {6'b0, max_aux_cmd_index_2_in};
                        5'h0D: user_r_control_regs_16_data <= {6'b0, max_aux_cmd_index_3_in};
                        5'h0E: user_r_control_regs_16_data <= {6'b0, loop_aux_cmd_index_1};
                        5'h0F: user_r_control_regs_16_data <= {6'b0, loop_aux_cmd_index_2};
                        5'h10: user_r_control_regs_16_data <= {6'b0, loop_aux_cmd_index_3};
                        5'h12: user_r_control_regs_16_data <= {data_stream_4_sel, data_stream_3_sel,  data_stream_2_sel,  data_stream_1_sel};  
                        5'h13: user_r_control_regs_16_data <= {data_stream_8_sel, data_stream_7_sel,  data_stream_6_sel,  data_stream_5_sel};
                        5'h14: user_r_control_regs_16_data <= {data_stream_12_sel, data_stream_11_sel,  data_stream_10_sel,  data_stream_9_sel};
                        5'h15: user_r_control_regs_16_data <= {data_stream_16_sel, data_stream_15_sel,  data_stream_14_sel,  data_stream_13_sel};
                        5'h16: user_r_control_regs_16_data <= {
                        data_stream_16_en_in,
                        data_stream_15_en_in,
                        data_stream_14_en_in,
                        data_stream_13_en_in,
                        data_stream_12_en_in,
                        data_stream_11_en_in,
                        data_stream_10_en_in,
                        data_stream_9_en_in,
                        data_stream_8_en_in,
                        data_stream_7_en_in,
                        data_stream_6_en_in,
                        data_stream_5_en_in,
                        data_stream_4_en_in,
                        data_stream_3_en_in,
                        data_stream_2_en_in,
                        data_stream_1_en_in
                        };
                        default:  user_r_control_regs_16_data <= 16'b0;
                    endcase
                end
          end
      end
      
      clock_generator clkgen(
      .config_clk_in(bus_clk),
      .clk_in(clk1),
      .rst(reset),
      .O(dataclk_O),
      .D(dataclk_D),
      .M(dataclk_M),
      .start_sig(PLL_start_trigger),
      .ready(PLL_prog_done),
      .locked(dataclk_locked),
      .clk_out(dataclk)
          );
      
    wire unused_spi_cdc;
    flag_cdc SPI_cdc(
              .clkA(bus_clk),
              .clkB(dataclk),
              .in(SPI_start_trigger),
              .out(SPI_start),
              .busy(unused_spi_cdc)
              );
    
      xillybus xillybus_ins (
      
          // Ports related to /dev/xillybus_auxcmd1_membank_16
          // CPU to FPGA signals:
          .user_w_auxcmd1_membank_16_wren(user_w_auxcmd1_membank_16_wren),
          .user_w_auxcmd1_membank_16_full(user_w_auxcmd1_membank_16_full),
          .user_w_auxcmd1_membank_16_data(user_w_auxcmd1_membank_16_data),
          .user_w_auxcmd1_membank_16_open(user_w_auxcmd1_membank_16_open),
      
          // Address signals:
          .user_auxcmd1_membank_16_addr(user_auxcmd1_membank_16_addr),
          .user_auxcmd1_membank_16_addr_update(user_auxcmd1_membank_16_addr_update),
      
      
          // Ports related to /dev/xillybus_auxcmd2_membank_16
          // CPU to FPGA signals:
          .user_w_auxcmd2_membank_16_wren(user_w_auxcmd2_membank_16_wren),
          .user_w_auxcmd2_membank_16_full(user_w_auxcmd2_membank_16_full),
          .user_w_auxcmd2_membank_16_data(user_w_auxcmd2_membank_16_data),
          .user_w_auxcmd2_membank_16_open(user_w_auxcmd2_membank_16_open),
      
          // Address signals:
          .user_auxcmd2_membank_16_addr(user_auxcmd2_membank_16_addr),
          .user_auxcmd2_membank_16_addr_update(user_auxcmd2_membank_16_addr_update),
      
      
          // Ports related to /dev/xillybus_auxcmd3_membank_16
          // CPU to FPGA signals:
          .user_w_auxcmd3_membank_16_wren(user_w_auxcmd3_membank_16_wren),
          .user_w_auxcmd3_membank_16_full(user_w_auxcmd3_membank_16_full),
          .user_w_auxcmd3_membank_16_data(user_w_auxcmd3_membank_16_data),
          .user_w_auxcmd3_membank_16_open(user_w_auxcmd3_membank_16_open),
      
          // Address signals:
          .user_auxcmd3_membank_16_addr(user_auxcmd3_membank_16_addr),
          .user_auxcmd3_membank_16_addr_update(user_auxcmd3_membank_16_addr_update),
      
      
          // Ports related to /dev/xillybus_control_regs_16
          // FPGA to CPU signals:
          .user_r_control_regs_16_rden(user_r_control_regs_16_rden),
          .user_r_control_regs_16_empty(user_r_control_regs_16_empty),
          .user_r_control_regs_16_data(user_r_control_regs_16_data),
          .user_r_control_regs_16_eof(user_r_control_regs_16_eof),
          .user_r_control_regs_16_open(user_r_control_regs_16_open),
      
          // CPU to FPGA signals:
          .user_w_control_regs_16_wren(user_w_control_regs_16_wren),
          .user_w_control_regs_16_full(user_w_control_regs_16_full),
          .user_w_control_regs_16_data(user_w_control_regs_16_data),
          .user_w_control_regs_16_open(user_w_control_regs_16_open),
      
          // Address signals:
          .user_control_regs_16_addr(user_control_regs_16_addr),
          .user_control_regs_16_addr_update(user_control_regs_16_addr_update),
      
      
          // Ports related to /dev/xillybus_neural_data_32
          // FPGA to CPU signals:
          .user_r_neural_data_32_rden(user_r_neural_data_32_rden),
          .user_r_neural_data_32_empty(user_r_neural_data_32_empty),
          .user_r_neural_data_32_data(user_r_neural_data_32_data),
          .user_r_neural_data_32_eof(user_r_neural_data_32_eof),
          .user_r_neural_data_32_open(user_r_neural_data_32_open),
      
      
          // Ports related to /dev/xillybus_status_regs_16
          // FPGA to CPU signals:
          .user_r_status_regs_16_rden(user_r_status_regs_16_rden),
          .user_r_status_regs_16_empty(user_r_status_regs_16_empty),
          .user_r_status_regs_16_data(user_r_status_regs_16_data),
          .user_r_status_regs_16_eof(user_r_status_regs_16_eof),
          .user_r_status_regs_16_open(user_r_status_regs_16_open),
      
          // Address signals:
          .user_status_regs_16_addr(user_status_regs_16_addr),
          .user_status_regs_16_addr_update(user_status_regs_16_addr_update),
      
      
          // General signals
          .PCIE_PERST_B_LS(PCIE_PERST_B_LS),
          .PCIE_REFCLK_N(PCIE_REFCLK_N),
          .PCIE_REFCLK_P(PCIE_REFCLK_P),
          .PCIE_RX_N(PCIE_RX_N),
          .PCIE_RX_P(PCIE_RX_P),
          .GPIO_LED(GPIO_LED),
          .PCIE_TX_N(PCIE_TX_N),
          .PCIE_TX_P(PCIE_TX_P),
          .bus_clk(bus_clk),
          .quiesce(quiesce)
        );

endmodule