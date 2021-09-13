#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=stress-ng
export VERSION=0.13.00
# Release:        1%{?dist}
# Group:          Benchmark
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.13.00.tar.xz
export SOURCE=stress-ng-0.13.00.tar.xz
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
make clean
make -j$(nproc)
# install
install
make DESTDIR=$SYSROOT install
# clean
clean

# %files
# path: /
# %defattr(-,root,root,-)
# %config
# %doc
epilog
