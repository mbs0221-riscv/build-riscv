# !/bin/bash

cd ~/linux
make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- menuconfig

export ROOTFS=/media/ubuntu/sdcard

make -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-
INSTALL_MOD_PATH=$ROOTFS make modules_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-

rm $ROOTFS/lib/modules/5.14.0-rc3-dirty/build
rm $ROOTFS/lib/modules/5.14.0-rc3-dirty/source
make -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-
ls -lh ~/linux/arch/riscv/boot/Image

