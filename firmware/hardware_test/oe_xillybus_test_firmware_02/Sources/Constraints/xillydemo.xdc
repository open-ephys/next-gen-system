create_clock -name sys_clk -period 10 [get_pins -match_style ucf */pcieclk_ibuf/O]

set_false_path -to [get_pins -match_style ucf */pipe_clock/pclk_i1_bufgctrl.pclk_i1/S0]
set_false_path -to [get_pins -match_style ucf */pipe_clock/pclk_i1_bufgctrl.pclk_i1/S1]
set_case_analysis 1 [get_pins -match_style ucf */pipe_clock/pclk_i1_bufgctrl.pclk_i1/S0]
set_case_analysis 0 [get_pins -match_style ucf */pipe_clock/pclk_i1_bufgctrl.pclk_i1/S1]

set_property DONT_TOUCH true [get_cells -of [get_nets -of [get_pins -match_style ucf */pipe_clock/pclk_i1_bufgctrl.pclk_i1/S0]]]
set_property DONT_TOUCH true [get_cells -hier -filter {name=~*/pipe_clock/pclk_sel*}]

set_false_path -from [get_ports PCIE_PERST_B_LS]

set_property LOC IBUFDS_GTE2_X0Y1 [get_cells -match_style ucf */pcieclk_ibuf]

set_property -dict "PACKAGE_PIN G25 IOSTANDARD LVCMOS25 PULLUP true" [get_ports PCIE_PERST_B_LS]

set_property -dict "PACKAGE_PIN AB8 IOSTANDARD LVCMOS15" [get_ports "GPIO_LED[0]"]
set_property -dict "PACKAGE_PIN AA8 IOSTANDARD LVCMOS15" [get_ports "GPIO_LED[1]"]
set_property -dict "PACKAGE_PIN AC9 IOSTANDARD LVCMOS15" [get_ports "GPIO_LED[2]"]
set_property -dict "PACKAGE_PIN AB9 IOSTANDARD LVCMOS15" [get_ports "GPIO_LED[3]"]



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
set_property IOSTANDARD LVCMOS33 [get_ports sma_direct_G24] 

set_property PACKAGE_PIN AK28 [get_ports sma_direct_G25]
set_property IOSTANDARD LVCMOS33 [get_ports sma_direct_G25] 

set_property PACKAGE_PIN AC26 [get_ports sma_direct_G27]
set_property IOSTANDARD LVCMOS33 [get_ports sma_direct_G27] 


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