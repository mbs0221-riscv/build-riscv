#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=liblinear
export VERSION=243
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/cjlin1/liblinear/archive/v243/liblinear-243.tar.gz
export SOURCE=liblinear-243.tar.gz
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
export CXX=riscv64-unknown-linux-gnu-g++
make lib
# install
install
mkdir -p $SYSROOT/usr/include
mkdir -p $SYSROOT/usr/lib
install -vm644 linear.h $SYSROOT/usr/include &&
install -vm755 liblinear.so.4 $SYSROOT/usr/lib &&
ln -sfv liblinear.so.4 $SYSROOT/usr/lib/liblinear.so
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
