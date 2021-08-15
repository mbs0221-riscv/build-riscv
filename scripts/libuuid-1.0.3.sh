#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libuuid
export VERSION=1.0.3
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://sourceforge.net/projects/libuuid/files/libuuid-1.0.3.tar.gz
export SOURCE=libuuid-1.0.3.tar.gz
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
./configure --prefix=$SYSROOT/usr/local               \
            --host=riscv64-unknown-linux-gnu               &&
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
