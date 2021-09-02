#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libgit2
export VERSION=1.1.1
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/libgit2/libgit2/archive/refs/tags/v1.1.1.tar.gz
export SOURCE=v1.1.1.tar.gz
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
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
test -d build || mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$BUILDROOT/usr \
         -DCMAKE_FIND_ROOT_PATH=$SYSROOT \
# build
build
cd build
cmake --build .
# install
install
cd build
cmake --build . --target install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
