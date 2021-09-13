#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=autoconf
export VERSION=2.69
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz
export SOURCE=autoconf-2.69.tar.xz
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
