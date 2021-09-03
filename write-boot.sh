#!/bin/bash -v

CONFIG=$2

dev=$1
dtb=$CONFIG.dtb

dtc -I dts -O dtb -o $CONFIG.dtb $CONFIG.dts

dd if=./fw_jump.bin       of=$dev seek=0   bs=1M
dd if=./Image             of=$dev seek=2   bs=1M
dd if=./$dtb              of=$dev seek=29  bs=1M
