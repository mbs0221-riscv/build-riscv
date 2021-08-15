#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=x265
export VERSION=3.4
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://anduin.linuxfromscratch.org/BLFS/x265/x265_3.4.tar.gz
export SOURCE=x265_3.4.tar.gz
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
setup -n x265_3.4
mkdir build && cd build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr %{_builddir}/x265_3.4/source/
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
