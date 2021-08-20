#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libvpx
export VERSION=1.10.0
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/webmproject/libvpx/archive/v1.10.0/libvpx-1.10.0.tar.gz
export SOURCE=libvpx-1.10.0.tar.gz
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
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
sed -i 's/cp -p/cp/' build/make/Makefile &&
mkdir libvpx-build            &&
cd    libvpx-build            &&
../configure --prefix=$SYSROOT/usr \
             --host=riscv64-unknown-linux-gnu- \
             --enable-shared  \
             --disable-static
# build
build
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
