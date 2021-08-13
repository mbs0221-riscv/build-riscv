#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=libtool
export VERSION=2.4.6
export URL=http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz
export SOURCE=libtool-2.4.6.tar.xz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/ \
--host=riscv64-unknown-linux-gnu \
cd $__build_dir_
make -j8
cd $__build_dir_
make install
# libtool --finish $SYSROOT/usr/lib
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
