#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=x264
export VERSION=20210211
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://anduin.linuxfromscratch.org/BLFS/x264/x264-20210211.tar.xz
export SOURCE=x264-20210211.tar.xz
# Requires(post): info
# Requires(preun): info
# %description
# # A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
post
# pre
prep
# setup
setup
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --enable-shared \
            --disable-cli
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
