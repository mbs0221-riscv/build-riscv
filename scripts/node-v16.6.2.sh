#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=node
export VERSION=v16.6.2
export URL=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/v16.6.2/node-v16.6.2.tar.gz
export SOURCE=node-v16.6.2.tar.gz
#wget https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/v16.6.2/node-v16.6.2.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/local \
--host=riscv64-unknown-linux-gnu \
cd $__build_dir_
make -j$(nproc)
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
