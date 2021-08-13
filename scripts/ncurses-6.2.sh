#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=ncurses
export VERSION=6.2
export URL=http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
export SOURCE=ncurses-6.2.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#build
cd $__build_dir_
#./configure --prefix=$ROOTFS --host=riscv64-unknown-linux-gnu --without-cxx --without-cxx-binding --without-ada --without-progs --without-tests --with-shared
./configure --prefix=$SYSROOT \
            --host=riscv64-unknown-linux-gnu \
            --without-cxx \
            --without-cxx-binding \
            --without-ada \
            --without-progs \
            --without-tests \
            --with-shared &&
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
