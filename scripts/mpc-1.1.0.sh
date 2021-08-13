#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=mpc
export VERSION=1.1.0
export URL=https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz
export SOURCE=mpc-1.1.0.tar.gz
# ./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu --with-mpfr=$SYSROOT/usr --with-gmp=$SYSROOT/usr --enable-shared
# make -j8 prefix=$SYSROOT/usr && make install prefix=$SYSROOT/usr
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
#export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
--host=riscv64-unknown-linux-gnu \
--with-mpfr=$SYSROOT/usr \
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
