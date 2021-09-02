#!/bin/bash

dtb=$(realpath $2)
echo Device Tree: $dtb

CC=riscv64-unknown-linux-gnu-
PAYLOAD=$(realpath $1)
echo Payload: $PAYLOAD

cd ~/opensbi
make PLATFORM=generic CROSS_COMPILE=$CC PLATFORM_RISCV_XLEN=64 FW_PAYLOAD=y FW_PAYLOAD_PATH=$PAYLOAD FW_FDT_PATH=$dtb clean
make PLATFORM=generic CROSS_COMPILE=$CC PLATFORM_RISCV_XLEN=64 FW_PAYLOAD=y FW_PAYLOAD_PATH=$PAYLOAD FW_FDT_PATH=$dtb install

cp ~/opensbi/build/platform/generic/firmware/fw_payload.bin /nfsroot/build-riscv/
