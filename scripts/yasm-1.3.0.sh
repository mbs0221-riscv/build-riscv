#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=yasm
export VERSION=1.3.0
# Release:        1%{?dist}
# Group:          System
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
export SOURCE=yasm-1.3.0.tar.gz
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
./configure --prefix=$BUILDROOT/usr \
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
