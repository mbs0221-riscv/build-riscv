#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=module-init-tools
export VERSION=3.15
export URL=https://mirrors.edge.kernel.org/pub/linux/utils/kernel/module-init-tools/module-init-tools-3.15.tar.gz
export SOURCE=module-init-tools-3.15.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
./configure --prefix=$SYSROOT \
--host=riscv64-unknown-linux-gnu \
--enable-zlib &&
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
