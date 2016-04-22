module xillydemo
  (
   input  PCIE_PERST_B_LS,
   input  PCIE_REFCLK_N,
   input  PCIE_REFCLK_P,
   input [7:0] PCIE_RX_N,
   input [7:0] PCIE_RX_P,
   output [3:0] GPIO_LED,
   output [7:0] PCIE_TX_N,
   output [7:0] PCIE_TX_P,
   
   input  sma_in_isol_H13,
   input  sma_in_isol_H14,
   output sma_out_isol_H23,
   
   output sma_direct_G24, // these are directly to the fpga and could be either in or outputs
   output sma_direct_G25,
   output sma_direct_G27,
   
   input MISO_C1, // isolated C spi, this is the one we soldered on all boards so far
   input MISO_C2, // these signals are just cmos33, no p/n
   output MOSI_C,
   output SCLK_C,
   output CS_C
   
//   input MISO_B1_p, // non-isolated B spi, this is the one we soldered on all boards so far
//   input MISO_B1_n,
//   input MISO_B2_p,
//   input MISO_B2_n,
//   output MOSI_B_p,
//   output MOSI_B_n,
//   output CS_B_p,
//   output CS_B_n,
//   output SCLK_B_p,
//   output SCLK_B_n
           
   );
   
   // Clock and quiesce
   wire 	bus_clk;
   wire 	quiesce;
   
   reg[7:0]   test_counter;
   
   // Memory array
   reg [7:0] 	demoarray[0:31];

   // Wires related to /dev/xillybus_mem_8
   wire       user_r_mem_8_rden;
   wire       user_r_mem_8_empty;
   reg [7:0]  user_r_mem_8_data;
   wire       user_r_mem_8_eof;
   wire       user_r_mem_8_open;
   wire       user_w_mem_8_wren;
   wire       user_w_mem_8_full;
   wire [7:0] user_w_mem_8_data;
   wire       user_w_mem_8_open;
   wire [4:0] user_mem_8_addr;
   wire       user_mem_8_addr_update;

   // Wires related to /dev/xillybus_read_32
   wire       user_r_read_32_rden;
   wire       user_r_read_32_empty;
   wire [31:0] user_r_read_32_data;
   wire        user_r_read_32_eof;
   wire        user_r_read_32_open;

   // Wires related to /dev/xillybus_read_8
   wire        user_r_read_8_rden;
   wire        user_r_read_8_empty;
   wire [7:0]  user_r_read_8_data;
   wire        user_r_read_8_eof;
   wire        user_r_read_8_open;

   // Wires related to /dev/xillybus_write_32
   wire        user_w_write_32_wren;
   wire        user_w_write_32_full;
   wire [31:0] user_w_write_32_data;
   wire        user_w_write_32_open;

   // Wires related to /dev/xillybus_write_8
   wire        user_w_write_8_wren;
   wire        user_w_write_8_full;
   wire [7:0]  user_w_write_8_data;
   wire        user_w_write_8_open;

   xillybus xillybus_ins (

			  // Ports related to /dev/xillybus_mem_8
			  // FPGA to CPU signals:
			  .user_r_mem_8_rden(user_r_mem_8_rden),
			  .user_r_mem_8_empty(user_r_mem_8_empty),
			  .user_r_mem_8_data(user_r_mem_8_data),
			  .user_r_mem_8_eof(user_r_mem_8_eof),
			  .user_r_mem_8_open(user_r_mem_8_open),

			  // CPU to FPGA signals:
			  .user_w_mem_8_wren(user_w_mem_8_wren),
			  .user_w_mem_8_full(user_w_mem_8_full),
			  .user_w_mem_8_data(user_w_mem_8_data),
			  .user_w_mem_8_open(user_w_mem_8_open),

			  // Address signals:
			  .user_mem_8_addr(user_mem_8_addr),
			  .user_mem_8_addr_update(user_mem_8_addr_update),


			  // Ports related to /dev/xillybus_read_32
			  // FPGA to CPU signals:
			  .user_r_read_32_rden(user_r_read_32_rden),
			  .user_r_read_32_empty(user_r_read_32_empty),
			  .user_r_read_32_data(user_r_read_32_data),
			  .user_r_read_32_eof(user_r_read_32_eof),
			  .user_r_read_32_open(user_r_read_32_open),

			  // Ports related to /dev/xillybus_write_32
			  // CPU to FPGA signals:
			  .user_w_write_32_wren(user_w_write_32_wren),
			  .user_w_write_32_full(user_w_write_32_full),
			  .user_w_write_32_data(user_w_write_32_data),
			  .user_w_write_32_open(user_w_write_32_open),

			  // Ports related to /dev/xillybus_read_8
			  // FPGA to CPU signals:
			  .user_r_read_8_rden(user_r_read_8_rden),
			  .user_r_read_8_empty(user_r_read_8_empty),
			  .user_r_read_8_data(user_r_read_8_data),
			  .user_r_read_8_eof(user_r_read_8_eof),
			  .user_r_read_8_open(user_r_read_8_open),

			  // Ports related to /dev/xillybus_write_8
			  // CPU to FPGA signals:
			  .user_w_write_8_wren(user_w_write_8_wren),
			  .user_w_write_8_full(user_w_write_8_full),
			  .user_w_write_8_data(user_w_write_8_data),
			  .user_w_write_8_open(user_w_write_8_open),


			  // Signals to top level
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


// LVDS buffer assignments
//OBUFDS lvds_driver_out_1 (.O(MOSI_B_p), .OB(MOSI_B_n), .I(MOSI_B));
//OBUFDS lvds_driver_out_2 (.O(CS_B_p), .OB(CS_B_n), .I(CS_B));
//OBUFDS lvds_driver_out_3 (.O(SCLK_B_p), .OB(SCLK_B_n), .I(SCLK_B));

//LVDS INPUT
//IBUFDS lvds_receiver_in_1 (.O(MISO_B1), .I(MISO_B1_p), .IB(MISO_B1_n));
//IBUFDS lvds_receiver_in_2 (.O(MISO_B2), .I(MISO_B2_p), .IB(MISO_B2_n));

assign sma_out_isol_H23 = test_counter[7];
assign sma_direct_G24 = test_counter[6];
assign sma_direct_G25 = test_counter[5];
assign sma_direct_G27 = test_counter[4];

assign spi_c_sclk = test_counter[6];
    
    always @(posedge bus_clk)  
        begin
         test_counter <= test_counter+1;
        end

   // A simple inferred RAM
   always @(posedge bus_clk)
     begin
	if (user_w_mem_8_wren)
	  demoarray[user_mem_8_addr] <= user_w_mem_8_data;
	
	if (user_r_mem_8_rden)
	  user_r_mem_8_data <= demoarray[user_mem_8_addr];	  
     end

   assign  user_r_mem_8_empty = 0;
   assign  user_r_mem_8_eof = 0;
   assign  user_w_mem_8_full = 0;

   // 32-bit loopback
   fifo_32x512 fifo_32
     (
      .clk(bus_clk),
      .srst(!user_w_write_32_open && !user_r_read_32_open),
      .din(user_w_write_32_data),
      .wr_en(user_w_write_32_wren),
      .rd_en(user_r_read_32_rden),
      .dout(user_r_read_32_data),
      .full(user_w_write_32_full),
      .empty(user_r_read_32_empty)
      );

   assign  user_r_read_32_eof = 0;
   
   // 8-bit loopback
   fifo_8x2048 fifo_8
     (
      .clk(bus_clk),
      .srst(!user_w_write_8_open && !user_r_read_8_open),
      .din(user_w_write_8_data),
      .wr_en(user_w_write_8_wren),
      .rd_en(user_r_read_8_rden),
      .dout(user_r_read_8_data),
      .full(user_w_write_8_full),
      .empty(user_r_read_8_empty)
      );

   assign  user_r_read_8_eof = 0;
   
endmodule
