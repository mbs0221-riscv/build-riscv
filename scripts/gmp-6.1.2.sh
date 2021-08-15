#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=gmp
export VERSION=6.1.2
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
export SOURCE=gmp-6.1.2.tar.xz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# ./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu
# make -j$(nproc) prefix=$SYSROOT/usr && make install prefix=$SYSROOT/usr
# pre
prep
# setup
setup
./configure --prefix=$SYSROOT/usr \
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
epilog
