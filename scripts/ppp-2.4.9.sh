#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=ppp
export VERSION=2.4.9
export URL=https://download.samba.org/pub/ppp/ppp-2.4.9.tar.gz
export SOURCE=ppp-2.4.9.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/local \
            --sysconfdir=$SYSROOT/etc \
            --cc=riscv64-unknown-linux-gnu-gcc \
            --cross-compile=riscv64-unknown-linux-gnu \
            --sysconf=$SYSROOT/etc
#build
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export STRIP=riscv64-unknown-linux-gnu-strip
make -j12
#install
cd $__build_dir_
make install
make install-etcppp
#clean

#files
#defattr(-,root,root,-)
#config /etc
#doc /usr/local/share
test $? -eq 0 || exit 0
cd $__build_dir_
