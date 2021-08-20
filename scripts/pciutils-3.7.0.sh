#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=pciutils
export VERSION=3.7.0
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.kernel.org/pub/software/utils/pciutils/pciutils-3.7.0.tar.xz
export SOURCE=pciutils-3.7.0.tar.xz
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
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
make PREFIX=$SYSROOT/usr SHARED=yes -j$(nproc)
# install
install
make PREFIX=$SYSROOT/usr SHARED=yes install install-lib
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
