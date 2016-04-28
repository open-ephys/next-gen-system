#SYSCLK
set_property PACKAGE_PIN AD11 [get_ports SYSCLK_N]
set_property IOSTANDARD LVDS [get_ports SYSCLK_N]
set_property PACKAGE_PIN AD12 [get_ports SYSCLK_P]
set_property IOSTANDARD LVDS [get_ports SYSCLK_P]

create_clock -name sys_clk -period 10 [get_nets sysclk]


set_property -dict "PACKAGE_PIN AB8 IOSTANDARD LVCMOS15" [get_ports "GPIO_LED[0]"]
set_property -dict "PACKAGE_PIN AA8 IOSTANDARD LVCMOS15" [get_ports "GPIO_LED[1]"]
set_property -dict "PACKAGE_PIN AC9 IOSTANDARD LVCMOS15" [get_ports "GPIO_LED[2]"]
set_property -dict "PACKAGE_PIN AB9 IOSTANDARD LVCMOS15" [get_ports "GPIO_LED[3]"]
set_property -dict "PACKAGE_PIN AE26 IOSTANDARD LVCMOS25" [get_ports "GPIO_LED[4]"]
set_property -dict "PACKAGE_PIN G19 IOSTANDARD LVCMOS25" [get_ports "GPIO_LED[5]"]
set_property -dict "PACKAGE_PIN E18 IOSTANDARD LVCMOS25" [get_ports "GPIO_LED[6]"]
set_property -dict "PACKAGE_PIN F16 IOSTANDARD LVCMOS25" [get_ports "GPIO_LED[7]"]

#GPIO PUSHBUTTON SW
set_property PACKAGE_PIN G12 [get_ports GPIO_SW_C]
set_property IOSTANDARD LVCMOS25 [get_ports GPIO_SW_C]
set_property PACKAGE_PIN AG5 [get_ports GPIO_SW_E]
set_property IOSTANDARD LVCMOS15 [get_ports GPIO_SW_E]
set_property PACKAGE_PIN AA12 [get_ports GPIO_SW_N]
set_property IOSTANDARD LVCMOS15 [get_ports GPIO_SW_N]
set_property PACKAGE_PIN AB12 [get_ports GPIO_SW_S]
set_property IOSTANDARD LVCMOS15 [get_ports GPIO_SW_S]
set_property PACKAGE_PIN AC6 [get_ports GPIO_SW_W]
set_property IOSTANDARD LVCMOS15 [get_ports GPIO_SW_W]
set_property PACKAGE_PIN AB7 [get_ports CPU_RESET]
set_property IOSTANDARD LVCMOS15 [get_ports CPU_RESET]


# isolated output from FPGA 
set_property PACKAGE_PIN AK26 [get_ports sma_out_isol_H23]
set_property IOSTANDARD LVCMOS33 [get_ports sma_out_isol_H23]

# isolated inputs to FPGA 
set_property PACKAGE_PIN AG25 [get_ports sma_in_isol_H13]
set_property IOSTANDARD LVCMOS33 [get_ports sma_in_isol_H13]

set_property PACKAGE_PIN AH25 [get_ports sma_in_isol_H14]
set_property IOSTANDARD LVCMOS33 [get_ports sma_in_isol_H14]

# direct SMAs (G24, 25, 27)
set_property PACKAGE_PIN AJ27 [get_ports sma_direct_G24]
set_property IOSTANDARD LVCMOS25 [get_ports sma_direct_G24] 

set_property PACKAGE_PIN AK28 [get_ports sma_direct_G25]
set_property IOSTANDARD LVCMOS25 [get_ports sma_direct_G25] 

set_property PACKAGE_PIN AC26 [get_ports sma_direct_G27]
set_property IOSTANDARD LVCMOS25 [get_ports sma_direct_G27] 


# C spi port (isolated, simple cmos33 logic, gets translated to lvds after isolator)
set_property PACKAGE_PIN AE25 [get_ports MISO_C1]
set_property IOSTANDARD LVCMOS33 [get_ports MISO_C1]

set_property PACKAGE_PIN AF25 [get_ports MISO_C2]
set_property IOSTANDARD LVCMOS33 [get_ports MISO_C2]

set_property PACKAGE_PIN AC24 [get_ports MOSI_C]
set_property IOSTANDARD LVCMOS33 [get_ports MOSI_C]

set_property PACKAGE_PIN AD24 [get_ports SCLK_C]
set_property IOSTANDARD LVCMOS33 [get_ports SCLK_C]

set_property PACKAGE_PIN AJ26 [get_ports CS_C]
set_property IOSTANDARD LVCMOS33 [get_ports CS_C]

# TODO: If we want to acctually use the isolated SPI busses, we need to make sure they use
# the same VCCO as the singled ended ports on the same bank. If they need to use a different
# VCCO, then their DIFF_TERM property should be set to false. Ideally, we should not have any
# non isolated pins anyway, so this is probably all mute.

## B spi port (non-isolated, goes straight to FMC pins)
#set_property PACKAGE_PIN AG30 [get_ports MISO_B1_p]
#set_property PACKAGE_PIN AH30 [get_ports MISO_B1_n]
#set_property IOSTANDARD LVDS_25 [get_ports {MISO_B1_p MISO_B1_n}]

#set_property PACKAGE_PIN AG27 [get_ports MISO_B2_p]
#set_property PACKAGE_PIN AG28 [get_ports MISO_B2_n]
#set_property IOSTANDARD LVDS_25 [get_ports {MISO_B2_p MISO_B2_n}]

#set_property PACKAGE_PIN AE30 [get_ports MOSI_B_p]
#set_property PACKAGE_PIN AF30 [get_ports MOSI_B_n]
#set_property IOSTANDARD LVDS_25 [get_ports {MOSI_B_p MOSI_B_n}]

#set_property PACKAGE_PIN AB29 [get_ports SCLK_B_p]
#set_property PACKAGE_PIN AB30 [get_ports SCLK_B_n]
#set_property IOSTANDARD LVDS_25 [get_ports {SCLK_B_p SCLK_B_n}]

#set_property PACKAGE_PIN Y30 [get_ports CS_B_p]
#set_property PACKAGE_PIN AA30 [get_ports CS_B_n]
#set_property IOSTANDARD LVDS_25 [get_ports {CS_B_p CS_B_n}]