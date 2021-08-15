#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libffi
export VERSION=3.4.2
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz
export SOURCE=libffi-3.4.2.tar.gz
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
./configure --prefix=$SYSROOT/usr/local \
            --host=riscv64-unknown-linux-gnu \
            --enable-shared \
            --with-sysroot &&
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
