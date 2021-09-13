#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=sqlite-autoconf
export VERSION=3360000
# Release:        1%{?dist}
# Group:          Database
# Summary:        A hello world program
# License:        GPLv3+
export URL=url
export SOURCE=sqlite-autoconf-3360000.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
./configure --prefix=$BUILDROOT/usr/ \
            --host=riscv64-unknown-linux-gnu
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
epilog
