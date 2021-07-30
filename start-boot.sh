#!/bin/bash

# reboot

fpga_dir=~/chipyard/fpga
tcl_dir=$fpga_dir/fpga-shells/xilinx/common/tcl
board=xc7vx690t_0

vivado -nojournal -mode batch \
	-source $tcl_dir/boot.tcl \
	-tclargs $board

