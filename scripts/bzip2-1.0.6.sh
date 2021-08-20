#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=bzip2
export VERSION=1.0.6
# Release:        1%{?dist}
# Group:          Compression
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://sourceforge.net/projects/bzip2/files/bzip2-1.0.6.tar.gz
export SOURCE=bzip2-1.0.6.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
prep
# setup
setup
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile-libbz2_so
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile-libbz2_so
sed -i "s/CC=gcc/CC?=gcc/" Makefile-libbz2_so
sed -i "s/AR=ar/AR?=ar/" Makefile-libbz2_so
sed -i "s/RANLIB=ranlib/RANLIB?=ranlib/" Makefile-libbz2_so
# build
build
export PREFIX=$SYSROOT/usr
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
make -j$(nproc) -f Makefile-libbz2_so
make clean
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
make -j$(nproc)
# install
install
make PREFIX=$SYSROOT/usr install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
