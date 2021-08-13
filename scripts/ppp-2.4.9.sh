#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=ppp
export VERSION=2.4.9
export URL=https://download.samba.org/pub/ppp/ppp-2.4.9.tar.gz
export SOURCE=ppp-2.4.9.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/local \
--sysconfdir=$SYSROOT/etc \
--cc=riscv64-unknown-linux-gnu-gcc \
--cross-compile=riscv64-unknown-linux-gnu \
--sysconf=$SYSROOT/etc
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export STRIP=riscv64-unknown-linux-gnu-strip
make -j12
cd $__build_dir_
make install
make install-etcppp
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
