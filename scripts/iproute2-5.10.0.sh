#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=iproute2
export VERSION=5.10.0
export URL=https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.10.0.tar.xz
export SOURCE=iproute2-5.10.0.tar.xz
#wget https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.10.0.tar.xz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr \
--host=riscv64-unknown-linux-gnu \
cd $__build_dir_
make -j$(nproc)
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
