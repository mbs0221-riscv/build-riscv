#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=cmake
export VERSION=3.21.1
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://cmake.org/files/v3.21/cmake-3.21.1.tar.gz
export SOURCE=cmake-3.21.1.tar.gz
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
sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake &&
./bootstrap --prefix=$SYSROOT/usr        \
            --system-libs        \
            --mandir=/share/man  \
            --no-system-jsoncpp  \
            --no-system-librhash \
            --docdir=/share/doc/cmake-3.21.1 \
            --no-system-curl
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
export AR=riscv64-unknown-linux-gnu-ar
export STRIP=riscv64-unknown-linux-gnu-strip
export RANLIB=riscv64-unknown-linux-gnu-ranlib
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
