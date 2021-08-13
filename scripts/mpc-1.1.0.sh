#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=mpc
export VERSION=1.1.0
export URL=https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz
export SOURCE=mpc-1.1.0.tar.gz
#description
# ./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu --with-mpfr=$SYSROOT/usr --with-gmp=$SYSROOT/usr --enable-shared
# make -j$(nproc) prefix=$SYSROOT/usr && make install prefix=$SYSROOT/usr
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-mpfr=$SYSROOT/usr \
            --with-gmp=$SYSROOT/usr \
            --enable-shared
#build
cd $__build_dir_
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
