#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=node
export VERSION=v16.6.2
export URL=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/v16.6.2/node-v16.6.2.tar.gz
export SOURCE=node-v16.6.2.tar.gz
#description
#pre
#post
#prep
#wget https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/v16.6.2/node-v16.6.2.tar.gz
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/local \
            --host=riscv64-unknown-linux-gnu \
#build
cd $__build_dir_
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
