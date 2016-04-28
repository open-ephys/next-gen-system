`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2016 18:01:57
// Design Name: 
// Module Name: clockgen_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clockgen_top(
        input SYSCLK_P,
        input SYSCLK_N,
        input GPIO_SW_C,
        input GPIO_SW_E,
        output [7:0] GPIO_LED,
        output sma_direct_G24
    );
    
    wire sysclk;
    wire btn_reset;
    wire btn_prog;
    
    reg pon_reset = 1'b1;
    wire rst;
    
    reg [4:0] pon_count = 5'h1F;
    
    reg [7:0] O;
    reg [3:0] D;
    reg [6:0] M;
    wire start;
    wire locked;
    wire clkout;
    wire done;
    
    reg [1:0] nextFreq = 2'b0;
    reg [2:0] startCount = 3'b0;
    reg programming = 1'b0;
    
    reg [23:0] ledCounter;
    
    OBUF(
            .I(clkout),
            .O(sma_direct_G24)
            );
        
   assign btn_reset = GPIO_SW_C;
    pushbutton_debouncer progB (
        .clk(sysclk),
        .button(GPIO_SW_E),
        .out(btn_prog)
    );
    
    clock_generator clkgen(
        .config_clk_in(sysclk),
        .clk_in(sysclk),
        .rst(rst),
        .O(O),
        .D(D),
        .M(M),
        .start(start),
        .program_done(done),
        .locked(locked),
        .clk_out(clkout)
    );
    
    assign start = (startCount != 3'b0);
    
    always @(posedge sysclk or posedge rst)
    begin
        if (rst)
        begin
            startCount <= 3'b0;
        end
        else
        begin
            if (startCount == 3'b0) //while start is asserted, never do anything
            begin
                if (done & btn_prog) //only do anything if controller is ready;
                begin
                    startCount <= 3'b111;
                end
            end
            else
                startCount <= startCount - 1;
        end
    end
    
    always @(posedge sysclk or posedge rst)
    begin
        if (rst)
        begin
            programming <= 1'b0;
            nextFreq <= 2'b0;
        end
        else
        begin
            if (startCount != 3'b0 && !done)
                programming <= 1'b1;
            
            if (programming && done)
            begin
                programming <= 1'b0;
                nextFreq <= nextFreq + 1;
             end
        end
    end
    
    always @*
    begin
        case (nextFreq)
            2'h0: //3.5MHz
            begin
                M = 7;
                D = 4;   
                O = 100; 
            end
            2'h1:
            begin //7MHz
                M = 35;
                D = 8;
                O = 125;  
            end
            2'h2:
            begin //14MHz
               M = 7;
               D = 4;
               O = 25; 
            end
            2'h3:
            begin //84MHz;
                M = 42;
                D = 4;
                O = 25;
            end
        endcase
    end    
    
    //LED assignment
    always @(posedge clkout or posedge rst)
    begin
        if (rst)
        begin
            ledCounter = 24'b0;
        end
        else
        begin
            ledCounter <= ledCounter + 1;
        end
    end
    
    assign GPIO_LED[0] = ledCounter[23];
    assign GPIO_LED[1] = programming;
    assign GPIO_LED[2] = done;
    assign GPIO_LED[3] = locked;
    assign GPIO_LED[7:6] = nextFreq;
    assign GPIO_LED[5] = rst;
    assign GPIO_LED[4]=btn_prog;
    
    
    
    //Reset logic
    assign rst = btn_reset | pon_reset;
    
    IBUFDS clkbuf(
        .I(SYSCLK_P),
        .IB(SYSCLK_N),
        .O(sysclk)
    );
    

    
    
    always @(posedge sysclk)
    begin
        if (pon_count != 5'h00)
        begin
            pon_count <= pon_count - 1;
            pon_reset <= 1'b1;
        end
        else
            pon_reset <= 1'b0;
    end
    
    
endmodule
