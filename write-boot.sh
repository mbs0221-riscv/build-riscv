#!/bin/bash -v

dev=$1
dtb=$2

dd if=fw_jump.bin of=$dev seek=0  status=progress oflag=sync 
dd if=Image       of=$dev seek=2  status=progress oflag=sync bs=1M
dd if=$dtb        of=$dev seek=29 status=progress oflag=sync bs=1M
