#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=vim
export VERSION=8.2.2433
export URL=http://anduin.linuxfromscratch.org/LFS/vim-8.2.2433.tar.gz
export SOURCE=vim-8.2.2433.tar.gz
#wget http://anduin.linuxfromscratch.org/LFS/vim-8.2.2433.tar.gz
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
