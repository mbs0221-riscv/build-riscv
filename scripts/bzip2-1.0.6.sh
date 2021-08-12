#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://sourceforge.net/projects/bzip2/files/bzip2-1.0.6.tar.gz
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile-libbz2_so
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile-libbz2_so
sed -i "s/CC=gcc/CC?=gcc/" Makefile-libbz2_so
sed -i "s/AR=ar/AR?=ar/" Makefile-libbz2_so
sed -i "s/RANLIB=ranlib/RANLIB?=ranlib/" Makefile-libbz2_so
export PREFIX=$SYSROOT/usr
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
#make -j$(nproc) libbz2.a bzip2 bzip2recover -f Makefile-libbz2_so
make -j$(nproc) all -f Makefile-libbz2_so
make PREFIX=$SYSROOT/usr install
echo pass

epilog

