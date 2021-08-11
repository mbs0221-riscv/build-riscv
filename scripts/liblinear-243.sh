#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://github.com/cjlin1/liblinear/archive/v243/liblinear-243.tar.gz
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
make lib
mkdir -p $SYSROOT/usr/include
mkdir -p $SYSROOT/usr/lib
install -vm644 linear.h $SYSROOT/usr/include &&
install -vm755 liblinear.so.4 $SYSROOT/usr/lib &&
ln -sfv liblinear.so.4 $SYSROOT/usr/lib/liblinear.so
