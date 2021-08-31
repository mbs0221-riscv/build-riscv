#!/bin/bash
set -e
 
DEVEL=/home/username/build_root/devel
 
if [ -d _build ];then
	rm -r _build
fi

mkdir _build
 
arch="$TARGET-"
sys_root="$SYSROOT"

#创建交叉编译配置文件cross_file.txt
 
#还可设置c_args等等类似 CFLAGS

echo "[binaries]" >> cross_file.txt
echo "c = $arch-gcc" >> cross_file.txt
echo "cpp = $arch-g++" >> cross_file.txt
echo "ar = $arch-ar" >> cross_file.txt
echo "ld = $arch-ld" >> cross_file.txt
echo "srtip = $arch-strip" >> cross_file.txt
echo "sys_root = '${sys_root}'" >> cross_file.txt
echo "pkg_config_libdir = '${sys_root}/usr/lib/pkgconfig'" >> cross_file.txt

echo "[host_machine]" >> cross_file.txt
echo "system = 'linux'" >> cross_file.txt
echo "cpu_family = 'riscv64gc'" >> cross_file.txt
echo "cpu = 'riscv64gc'" >> cross_file.txt
echo "endian = 'little'" >> cross_file.txt
 
#类似于configure功能 meson configure 获取到可配置项
echo "[project options]" >> cross_file.txt
echo "prefix = '/usr'" >> cross_file.txt
echo "selinux = 'disabled'" >> cross_file.txt
echo "libelf = 'disabled'" >> cross_file.txt
 
#类似于执行configure
meson setup _build --cross-file cross_file.txt
cd _build

#编译 类似于make
ninja
cd ../ 

#类似于make install DESTDIR=$DEVEL
DESTDIR=$DEVEL meson install
