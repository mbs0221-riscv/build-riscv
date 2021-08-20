#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=lrzsz
export VERSION=0.12.20
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://src.fedoraproject.org/repo/pkgs/lrzsz/lrzsz-0.12.20.tar.gz/b5ce6a74abc9b9eb2af94dffdfd372a4/lrzsz-0.12.20.tar.gz
export SOURCE=lrzsz-0.12.20.tar.gz
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
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
export STRIP=riscv64-unknown-linux-gnu-strip
./configure --host=riscv64-unknown-linux-gnu           \
            --prefix=$SYSROOT/usr
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,ubuntu,ubuntu,-)
epilog
