#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=flex
export VERSION=2.6.4
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
export SOURCE=flex-2.6.4.tar.gz
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
#wget https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
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
