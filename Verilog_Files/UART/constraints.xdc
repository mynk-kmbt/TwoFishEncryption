## Clock Signal
set_property PACKAGE_PIN E3 [get_ports clk_100MHz]
set_property IOSTANDARD LVCMOS33 [get_ports clk_100MHz]
## UART Ports
set_property PACKAGE_PIN D4 [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports tx]

set_property PACKAGE_PIN C4 [get_ports rx]
set_property IOSTANDARD LVCMOS33 [get_ports rx]

## Custom Outputs (Change as needed)
set_property PACKAGE_PIN V11 [get_ports converted]
set_property IOSTANDARD LVCMOS33 [get_ports converted]

set_property PACKAGE_PIN V12 [get_ports data_valid]
set_property IOSTANDARD LVCMOS33 [get_ports data_valid]

set_property PACKAGE_PIN V14 [get_ports rx_busy]
set_property IOSTANDARD LVCMOS33 [get_ports rx_busy]

set_property PACKAGE_PIN V15 [get_ports tx_busy]
set_property IOSTANDARD LVCMOS33 [get_ports tx_busy]

set_property PACKAGE_PIN J15 [get_ports in[0]]
set_property IOSTANDARD LVCMOS33 [get_ports in[0]]

set_property PACKAGE_PIN L16 [get_ports in[1]]
set_property IOSTANDARD LVCMOS33 [get_ports in[1]]

set_property PACKAGE_PIN M13 [get_ports in[2]]
set_property IOSTANDARD LVCMOS33 [get_ports in[2]]

set_property PACKAGE_PIN V10 [get_ports mode]
set_property IOSTANDARD LVCMOS33 [get_ports mode]
