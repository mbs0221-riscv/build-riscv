#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libbytesize
export VERSION=2.6
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/storaged-project/libbytesize/releases/download/2.6/libbytesize-2.6.tar.gz
export SOURCE=libbytesize-2.6.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
prep
# setup
setup
./configure --prefix=$BUILDROOT/usr/ \
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
