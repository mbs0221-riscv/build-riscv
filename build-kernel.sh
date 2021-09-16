# !/bin/bash

cd ~/linux
make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- menuconfig
make -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-

export ROOTFS=/media/ubuntu/sdcard
INSTALL_MOD_PATH=$ROOTFS make modules_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-
INSTALL_MOD_PATH=$SYSROOT make modules_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-

ls -lh ~/linux/arch/riscv/boot/Image

