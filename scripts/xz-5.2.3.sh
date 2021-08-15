#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=xz
export VERSION=5.2.3
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://tukaani.org/xz/xz-5.2.3.tar.xz
export SOURCE=xz-5.2.3.tar.xz
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
