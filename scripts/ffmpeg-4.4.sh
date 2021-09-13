#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=ffmpeg
export VERSION=4.4
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://ffmpeg.org/releases/ffmpeg-4.4.tar.xz
export SOURCE=ffmpeg-4.4.tar.xz
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
./configure --prefix=$SYSROOT/usr/ \
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
# path: /usr/
# %defattr(-,root,root,-)
# %config
# %doc
epilog
