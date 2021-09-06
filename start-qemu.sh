#!/bin/bash

cp ~/linux/arch/riscv/boot/Image ./
qemu-system-riscv64 -M virt -m 4G -nographic -bios ./fw_jump.bin -kernel ./Image -drive file=../rootfs.cpio,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -append "root=/dev/vda rw console=ttyS0"

