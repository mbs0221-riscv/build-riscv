#!/bin/bash

dev=$1

echo Device: $dev

./serial $dev 0x80000000 ./opensbi/build/platform/generic/firmware/fw_jump.bin
./serial $dev 0x80200000 ./u-boot/u-boot.bin
./serial $dev

minicom
#screen $dev 115200     
