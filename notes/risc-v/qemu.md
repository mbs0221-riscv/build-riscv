## QEMU
安装qemu for riscv
```
git clone https://github.com/qemu/qemu
cd qemu
git checkout v5.0.0
./configure --target-list=riscv64-softmmu --prefix=${RISCV}
make
make install
```
制作最小文件系统
```
qemu-img create sysroot.img  1g
mkfs.ext4 sysroot.img
mkdir sysroot
sudo mount -o loop sysroot.img  sysroot
cd sysroot
sudo cp -r ../busyboxsource/_install/* .
sudo mkdir proc sys dev etc etc/init.d
cd etc/init.d/
sudo touch rcS
sudo vi rcS
```
编译内容如下：
```
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
/sbin/mdev -s
```
然后修改文件权限
```
sudo mod +x rcS
sudo umount rootfs
```

```
mkfs.ext4 rootfs.img
qemu-img resize rootfs.img -f raw +32G
sudo mount -o loop rootfs.img  rootfs
sudo cpio -i -u -I ../../rootfs-3.0.cpio
sudo mount -o loop rootfs.img  rootfs
rsync -azvpP /home/ubuntu/rpmbuild /nfsroot/build-riscv/rootfs/home/ubuntu/

make headers_install -j$(nproc) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- INSTALL_HDR_PATH=/nfsroot/build-riscv/rootfs/usr/
```
