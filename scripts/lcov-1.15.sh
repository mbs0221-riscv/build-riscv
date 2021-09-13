#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=lcov
export VERSION=1.15
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://sourceforge.net/projects/ltp/files/Coverage%20Analysis/LCOV-1.15/lcov-1.15.tar.gz
export SOURCE=lcov-1.15.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
make clean && make
# install
install
export DESTDIR=$SYSROOT
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
