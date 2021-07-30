# !/bin/bash

cd ~/linux
make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- menuconfig

make -j12 ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-
INSTALL_MOD_PATH=$ROOTFS make modules_install -j12 ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-

rm $ROOTFS/lib/modules/5.11.0-rc3+/build
rm $ROOTFS/lib/modules/5.11.0-rc3+/source
make -j12 ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-
ls -l ~/linux/arch/riscv/boot/Image

cd ~/riscv-linux
