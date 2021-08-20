#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=curl
export VERSION=7.78.0
# Release:        1%{?dist}
# Group:          Network
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://curl.se/download/curl-7.78.0.tar.xz
export SOURCE=curl-7.78.0.tar.xz
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
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-libssh2 \
            --with-openssl \
            --with-zstd
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
