#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=gvpe
export VERSION=3.1
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/gnu/gvpe/gvpe-3.1.tar.gz
export SOURCE=gvpe-3.1.tar.gz
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
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --enable-digest=sha1 \
            --enable-cipher=aes-128 \
            --enable-dns
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
