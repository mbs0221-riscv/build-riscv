#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=mpfr
export VERSION=4.0.1
export URL=http://www.mpfr.org/mpfr-4.0.1/mpfr-4.0.1.tar.xz
export SOURCE=mpfr-4.0.1.tar.xz
# ./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu --with-gmp=$SYSROOT/usr --enable-shared
# make -j8 prefix=$SYSROOT/usr && make install prefix=$SYSROOT/usr
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
--host=riscv64-unknown-linux-gnu \
--with-gmp=$SYSROOT/usr \
--enable-shared
cd $__build_dir_
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
