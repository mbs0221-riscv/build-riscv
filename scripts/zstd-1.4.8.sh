#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=zstd
export VERSION=1.4.8
# Release:        1%{?dist}
# Group:          Compression
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz
export SOURCE=zstd-1.4.8.tar.gz
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
#wget https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz
# setup
setup
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
#export CC=afl-clang-fast
#export CFLAGS="--gcc-toolchain=$TOOLCHAIN --sysroot=$SYSROOT --target=$TARGET -march=$MARCH"
make -j$(nproc)
# install
install
make install PREFIX=$BUILDROOT/usr
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
