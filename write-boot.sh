#!/bin/bash -v

dev=$1
dtb=$2

sudo dd if=fw_jump.bin of=$dev seek=0  status=progress oflag=sync 
sudo dd if=Image       of=$dev seek=2  status=progress oflag=sync bs=1M
sudo dd if=$dtb        of=$dev seek=39 status=progress oflag=sync bs=1M
