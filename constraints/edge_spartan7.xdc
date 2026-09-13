# EDGE Spartan-7 FPGA Development Board
# FPGA: XC7S15-1FTGB196C
# Clock: 50 MHz


# CLOCK
set_property -dict { PACKAGE_PIN H11 IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -period 20.000 -name sys_clk [get_ports clk]

# SWITCHES
# sw[3:0] = First BCD Number
# sw[7:4] = Second BCD Number

set_property -dict { PACKAGE_PIN K11 IOSTANDARD LVCMOS33 } [get_ports {sw[0]}]
set_property -dict { PACKAGE_PIN M11 IOSTANDARD LVCMOS33 } [get_ports {sw[1]}]
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports {sw[2]}]
set_property -dict { PACKAGE_PIN P12 IOSTANDARD LVCMOS33 } [get_ports {sw[3]}]

set_property -dict { PACKAGE_PIN N10 IOSTANDARD LVCMOS33 } [get_ports {sw[4]}]
set_property -dict { PACKAGE_PIN P10 IOSTANDARD LVCMOS33 } [get_ports {sw[5]}]
set_property -dict { PACKAGE_PIN M10 IOSTANDARD LVCMOS33 } [get_ports {sw[6]}]
set_property -dict { PACKAGE_PIN N4 IOSTANDARD LVCMOS33 } [get_ports {sw[7]}]


# CARRY INPUT
# Center push button
# Active HIGH with internal pulldown

set_property -dict {
    PACKAGE_PIN J12
    IOSTANDARD LVCMOS33
    PULLDOWN true
} [get_ports c_in]


# 7-SEGMENT DIGIT ENABLES
# Common-anode display: Active LOW
#
# an[0] = rightmost digit / LSB
# an[1] = next digit

set_property -dict { PACKAGE_PIN H4 IOSTANDARD LVCMOS33 } [get_ports {an[0]}]
set_property -dict { PACKAGE_PIN H3 IOSTANDARD LVCMOS33 } [get_ports {an[1]}]
set_property -dict { PACKAGE_PIN H2 IOSTANDARD LVCMOS33 } [get_ports {an[2]}]
set_property -dict { PACKAGE_PIN H1 IOSTANDARD LVCMOS33 } [get_ports {an[3]}]


# 7-SEGMENT DISPLAY SEGMENTS
#
# Verilog:
# seg[6] = A
# seg[5] = B
# seg[4] = C
# seg[3] = D
# seg[2] = E
# seg[1] = F
# seg[0] = G
#
# Common-anode: 0 = ON, 1 = OFF

# Segment A
set_property -dict { PACKAGE_PIN L3 IOSTANDARD LVCMOS33 } [get_ports {seg[6]}]

# Segment B
set_property -dict { PACKAGE_PIN P4 IOSTANDARD LVCMOS33 } [get_ports {seg[5]}]

# Segment C
set_property -dict { PACKAGE_PIN P2 IOSTANDARD LVCMOS33 } [get_ports {seg[4]}]

# Segment D
set_property -dict { PACKAGE_PIN M3 IOSTANDARD LVCMOS33 } [get_ports {seg[3]}]

# Segment E
set_property -dict { PACKAGE_PIN M1 IOSTANDARD LVCMOS33 } [get_ports {seg[2]}]

# Segment F
set_property -dict { PACKAGE_PIN J4 IOSTANDARD LVCMOS33 } [get_ports {seg[1]}]

# Segment G
set_property -dict { PACKAGE_PIN K4 IOSTANDARD LVCMOS33 } [get_ports {seg[0]}]