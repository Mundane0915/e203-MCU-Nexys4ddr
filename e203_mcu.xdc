# Clock signal
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports CLK100MHZ]
# set_property -dict { PACKAGE_PIN F15    IOSTANDARD LVCMOS33 } [get_ports { CLK32768KHZ }];
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports CLK100MHZ]
# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets dut_io_pads_jtag_TCK_i_ival]
# set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IOBUF_jtag_TCK/O]

# Reset
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports fpga_rst]
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports mcu_rst]

# QSPI interface
set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports {qspi0_dq[0]}]
set_property -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS33} [get_ports {qspi0_dq[1]}]
set_property -dict {PACKAGE_PIN L14 IOSTANDARD LVCMOS33} [get_ports {qspi0_dq[2]}]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {qspi0_dq[3]}]
set_property -dict {PACKAGE_PIN L13 IOSTANDARD LVCMOS33} [get_ports qspi0_cs]

# JTAG connection
# set_property -dict { PACKAGE_PIN E13   IOSTANDARD LVCMOS33 } [get_ports { mcu_TDO }];
# set_property -dict { PACKAGE_PIN E10   IOSTANDARD LVCMOS33 } [get_ports { mcu_TCK }];
# set_property -dict { PACKAGE_PIN E11   IOSTANDARD LVCMOS33 } [get_ports { mcu_TDI }];
# set_property -dict { PACKAGE_PIN E12   IOSTANDARD LVCMOS33 } [get_ports { mcu_TMS }];

# pmu_wakeup
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports pmu_paden]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports pmu_padrst]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports mcu_wakeup]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
