#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=tree
export VERSION=1.8.0
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://mama.indstate.edu/users/ice/tree/src/tree-1.8.0.tgz
export SOURCE=tree-1.8.0.tgz
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
#./configure --prefix=$SYSROOT/usr \
#            --host=riscv64-unknown-linux-gnu \
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
make -j$(nproc)
# install
install
make DESTDIR=$SYSROOT/usr install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
