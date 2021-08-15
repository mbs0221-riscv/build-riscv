#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=gperf
export VERSION=3.1
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz
export SOURCE=gperf-3.1.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
export RANLIB=riscv64-unknown-linux-gnu-ranlib
export STRIP=riscv64-unknown-linux-gnu-strip
./configure --prefix=$SYSROOT/usr/local/   \
            --host=riscv64-unknown-linux-gnu    &&
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /usr/local/
# %defattr(-,root,root,-)
epilog
