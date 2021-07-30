#!/bin/bash

dev=$1

echo Device: $dev

./serial $dev 0x80000000 ./opensbi/build/platform/generic/firmware/fw_jump.bin
./serial $dev 0x80200000 ./opensbi/build/platform/generic/firmware/payloads/test.bin
./serial $dev

#minicom
screen -L $dev 115200 
