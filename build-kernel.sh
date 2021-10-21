# !/bin/bash

cd ~/linux
make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- menuconfig
make -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-

export ROOTFS=/media/ubuntu/sdcard
make modules_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- INSTALL_MOD_PATH=$ROOTFS
make headers_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- INSTALL_HDR_PATH=$ROOTFS/usr

make modules_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- INSTALL_MOD_PATH=$SYSROOT
make headers_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- INSTALL_HDR_PATH=$SYSROOT/usr

cp ~/chipyard/fpga/generated-src/chipyard.fpga.vc709.VC709FPGATestHarness.RocketVC709Config/chipyard.fpga.vc709.VC709FPGATestHarness.RocketVC709Config.dts ./
CONFIG=chipyard.fpga.vc709.VC709FPGATestHarness.RocketVC709Config
dtc -I dts -O dtb -o $CONFIG.dtb $CONFIG.dts

cp ~/linux/arch/riscv/boot/Image ./Image
sudo ./write-boot.sh /dev/sdb1 chipyard.fpga.vc709.VC709FPGATestHarness.RocketVC709Config.dtb

ls -lh ~/linux/arch/riscv/boot/Image
rsync -azvpP $SYSROOT/lib/modules/5.14.0-rc6+/  -e 'dbclient -p 2222' root@vc709:/lib/modules/5.14.0-rc6+/
