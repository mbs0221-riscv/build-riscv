#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libusb
export VERSION=1.0.24
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/libusb/libusb/releases/download/v1.0.24/libusb-1.0.24.tar.bz2
export SOURCE=libusb-1.0.24.tar.bz2
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
setup
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
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
