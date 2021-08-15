#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=nghttp2
export VERSION=1.44.0
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/nghttp2/nghttp2/releases/download/v1.44.0/nghttp2-1.44.0.tar.xz
export SOURCE=nghttp2-1.44.0.tar.xz
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
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
#export CC=riscv64-unknown-linux-gnu-gcc
#export CXX=riscv64-unknown-linux-gnu-g++
export CFLAGS="$CFLAGS -I$SYSROOT/usr/include/python3.9"
export LDFLAGS="$LDFLAGS -L$SYSROOT/usr/lib/python3.9"
export LIBS="-L$SYSROOT/usr/lib/python"
export PYTHON=/usr/bin/python3.9
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
# %config
# %doc
epilog
