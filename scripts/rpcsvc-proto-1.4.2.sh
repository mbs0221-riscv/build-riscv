#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=rpcsvc-proto
export VERSION=1.4.2
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=url
export SOURCE=rpcsvc-proto-1.4.2.tar.xz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
./configure --prefix=$SYSROOT/usr          \
            --host=riscv64-unknown-linux-gnu
# build
build
make -j$(nproc)
# install
install
make install-strip
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
