#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=curl
export VERSION=7.78.0
# Release:        1%{?dist}
# Group:          Network
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://curl.se/download/curl-7.78.0.tar.xz
export SOURCE=curl-7.78.0.tar.xz
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
export CPPFLAGS="$CPPFLAGS -I$SYSROOT/include -I$SYSROOT/usr/include -I$SYSROOT/usr/local/include"
export LDFLAGS="$LDFLAGS -L$SYSROOT/lib -L$SYSROOT/usr/lib -L$SYSROOT/usr/local/lib"
export PKG_CONFIG_PATH=$SYSROOT/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-libssh2 \
            --with-openssl \
            --with-zstd
#            --with-brotli \
#            --with-libidn2 \
#            --with-nghttp2 \
#            --with-gssapi \
# build
build
make clean
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
