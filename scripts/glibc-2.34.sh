#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=glibc
export VERSION=2.34
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://ftp.gnu.org/gnu/glibc/glibc-2.34.tar.xz
export SOURCE=glibc-2.34.tar.xz
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
#wget https://ftp.gnu.org/gnu/glibc/glibc-2.34.tar.xz
# setup
setup
mkdir build && cd build
../configure --prefix=$SYSROOT/ \
             --host=riscv64-unknown-linux-gnu \
# build
build
cd build
make -j$(nproc)
# install
install
cd build
make all install
# clean
clean

# %files
# path: /
# %defattr(-,root,root,-)
# %config
# %doc
epilog
