#!/bin/bash

LONG_NAME=chipyard.fpga.vc709.VC709FPGATestHarness.$CONFIG

export CHIPYAR=~/chipyard
export FPGA=$CHIPYARD/fpga
export RESOURCES=$FPGA/src/main/resources
export GEN_PATH=$FPGA/generated-src
export OBJ_PATH=$GEN_PATH/$LONG_NAME/obj
export TCL_DIR=$FPGA/fpga-shells/xilinx/common/tcl

BOARD=xc7vx690t_0
MCS=$OBJ_PATH/VC709FPGATestHarness.mcs
PRM=$OBJ_PATH/VC709FPGATestHarness.prm

##################### HARDWARE FLOW #####################

# build project

cd $FPGA
make -j12 SUB_PROJECT=vc709 CONFIG=$CONFIG mcs

# boot the board from mcs

echo upload: $MCS
echo upload: $PRM

vivado -nojournal -mode batch \
        -source $TCL_DIR/upload_mcs.tcl \
        -tclargs $BOARD $MCS $PRM \

vivado -nojournal -mode batch \
        -source $TCL_DIR/boot.tcl \
        -tclargs $BOARD

##################### SOFTWARE FLOW #####################
cd ~/riscv-linux

cp -p $RESOURCES/vc709/uartsend/upload ./
dtc -I dts -O dtb -o $LONG_NAME.dtb $GEN_PATH/$LONG_NAME/$LONG_NAME.dts

#./start-kernel.sh $LONG_NAME.dtb
