#!/bin/bash -v

dev=$1
dtb=$2

dd if=fw_jump.bin of=$dev seek=0
dd if=Image       of=$dev seek=2   bs=1M
dd if=$dtb        of=$dev seek=29  bs=1M
