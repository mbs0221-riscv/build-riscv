#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=npth
export VERSION=1.6.spec
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=npth-1.6.spec
export SOURCE=npth-1.6.spec
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
./configure --prefix=$SYSROOT/usr/local \
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
# path: /usr/local
# %defattr(-,root,root,-)
# %config
# %doc
epilog
