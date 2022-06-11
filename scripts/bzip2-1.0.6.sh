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
post
# pre
prep
# setup
setup
PKG_CONFIG_PATH=$SYSROOT/lib/pkgconfig:$PKG_CONFIG_PATH
PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH
sed -i '25c CC?=gcc' Makefile-libbz2_so
sed -i '27c PREFIX?=/usr/local' Makefile-libbz2_so
sed -i 's#\(ln -s -f \)$(PREFIX)/bin/#\1#' Makefile
sed -i 's#$(PREFIX)/man#$(PREFIX)/share/man#g' Makefile
sed -i '18c CC?=gcc' Makefile
sed -i '19c AR?=ar' Makefile
sed -i '20c RANLIB?=ranlib' Makefile
sed -i '27c PREFIX?=/usr/local' Makefile
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
export CFLAGS=-fPIC
make all -j$(nproc) -f Makefile-libbz2_so
make libbz2.a bzip2 bzip2recover
# install
install
make PREFIX=$BUILDROOT/usr install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
