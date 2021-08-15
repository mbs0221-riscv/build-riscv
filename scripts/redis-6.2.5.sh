#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=redis
export VERSION=6.2.5
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://download.redis.io/releases/redis-6.2.5.tar.gz
export SOURCE=redis-6.2.5.tar.gz
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
#wget https://download.redis.io/releases/redis-6.2.5.tar.gz
# setup
setup
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
export STRIP=riscv64-unknown-linux-gnu-strip
make -j$(nproc) MALLOC=libc
# install
install
make PREFIX=$SYSROOT/usr/local install
# clean
clean

# %files
# path: /usr/local
# %defattr(-,root,root,-)
# %config
# %doc
epilog
