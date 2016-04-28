`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2016 17:52:51
// Design Name: 
// Module Name: pushbutton_debouncer
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


module pushbutton_debouncer(
    input clk,
    input button,
    output reg out
    );
    
    reg [10:0] reset_counter = 11'b0;
    reg rdy = 1'b1;
    
    always @(posedge clk)
    begin
        out <= 1'b0;
        if (reset_counter == 11'b0)
        begin
            if (button && rdy)
            begin
                reset_counter <= reset_counter + 1;
                out <= 1'b1;
                rdy <= 1'b0;
            end
            if (!button && !rdy)
            begin
                rdy <= 1'b1;
            end
        end
        else
        begin
            reset_counter <= reset_counter + 1;
        end

    end
    
endmodule
