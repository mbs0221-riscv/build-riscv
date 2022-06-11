#!/bin/bash -v

dtb=$1

# fw_jump
#sudo dd if=fw_jump.bin   of=/dev/sdb1 seek=0  status=progress oflag=sync bs=4096
#sudo dd if=Image         of=/dev/sdb1 seek=2  status=progress oflag=sync bs=1M
#sudo dd if=$dtb          of=/dev/sdb1 seek=39 status=progress oflag=sync bs=1M

# fw_payload
sudo dd if=fw_payload.bin of=/dev/sdb1 seek=0  status=progress oflag=sync bs=4096
sudo dd if=$dtb           of=/dev/sdb1 seek=34 status=progress oflag=sync bs=4096

sudo dd if=VC709fsbl.bin  of=/dev/sdb2 seek=0  status=progress conv=fsync bs=4096 
