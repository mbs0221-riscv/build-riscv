#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=bzip2
export VERSION=1.0.6
export URL=https://sourceforge.net/projects/bzip2/files/bzip2-1.0.6.tar.gz
export SOURCE=bzip2-1.0.6.tar.gz
#description
#pre
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile-libbz2_so
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile-libbz2_so
sed -i "s/CC=gcc/CC?=gcc/" Makefile-libbz2_so
sed -i "s/AR=ar/AR?=ar/" Makefile-libbz2_so
sed -i "s/RANLIB=ranlib/RANLIB?=ranlib/" Makefile-libbz2_so
#build
cd $__build_dir_
export PREFIX=$SYSROOT/usr
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
#make -j$(nproc) libbz2.a bzip2 bzip2recover -f Makefile-libbz2_so
make -j$(nproc) all -f Makefile-libbz2_so
#install
cd $__build_dir_
make PREFIX=$SYSROOT/usr install
echo pass
#clean

#files
#defattr(-,root,root,-)
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
