#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=nginx
export VERSION=1.6.2
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://nginx.org/download/nginx-1.6.2.tar.gz
export SOURCE=nginx-1.6.2.tar.gz
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
export CC_PATH=$RISCV/bin/riscv64-unknown-linux-gnu-gcc
export CPP_PATH=$RISCV/bin/riscv64-unknown-linux-gnu-g++
sed -i '21s/^/#/' auto/cc/name
./configure --prefix=$SYSROOT/usr \
            --with-pcre=$SYSROOT/usr \
            --with-zlib=$SYSROOT/usr \
            --with-http_stub_status_module \
            --with-http_ssl_module \
            --with-libatomic=$SYSROOT \
            --with-openssl=$SYSROOT/usr \
            --with-cc=$RISCV/bin/riscv64-unknown-linux-gnu-gcc \
            --with-cpp=$RISCV/bin/riscv64-unknown-linux-gnu-g++
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
