#!/bin/bash

#cp ~/linux/arch/riscv/boot/Image ./
#qemu-system-riscv64 -M virt -m 4G -nographic -bios ./fw_jump.bin -kernel ./Image -drive file=../rootfs.img,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -append "root=/dev/vda rw console=ttyS0"
#qemu-system-riscv64 -M virt -m 4G -nographic -bios fw_jump.bin -kernel ~/linux/arch/riscv/boot/Image -drive file=rootfs.img,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -append "root=/dev/vda rw console=ttyS0"

qemu-system-riscv64 \
	-smp sockets=1,cores=4,threads=2 \
	-M virt -m 32G -nographic \
	-bios fw_jump.bin \
	-kernel qemu-linux-Image \
	-drive file=rootfs.img,format=raw,id=hd0 \
	-device virtio-blk-device,drive=hd0 \
	-append "root=/dev/vda rw console=ttyS0"
