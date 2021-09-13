#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=AFL
export VERSION=2.57b
# Release:        1%{?dist}
# Group:          System
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/google/AFL/archive/refs/tags/v2.57b.tar.gz
export SOURCE=v2.57b.tar.gz
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
# build
build
export CC=clang
export CFLAGS="--gcc-toolchain=$TOOLCHAIN --sysroot=$SYSROOT --target=$TARGET -march=$MARCH"
export AFL_NO_X86=1
export LLVM_CONFIG=/usr/bin/llvm-config-12
make clean
make all
# install
install
export AFL_NO_X86=1
make DESTDIR=$SYSROOT PREFIX=/usr install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
