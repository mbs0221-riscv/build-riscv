#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libcap
export VERSION=2.48
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.48.tar.xz
export SOURCE=libcap-2.48.tar.xz
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
#wget https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.48.tar.xz
# setup
setup
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
make -j$(nproc)
# install
install
make install FAKEROOT=$BUILDROOT
# clean
clean

# %files
# path: /
# %defattr(-,root,root,-)
# %config
# %doc
epilog
