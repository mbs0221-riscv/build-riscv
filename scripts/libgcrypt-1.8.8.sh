#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libgcrypt
export VERSION=1.8.8
# Release:        1%{?dist}
# Group:          GnuPG
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.8.tar.bz2
export SOURCE=libgcrypt-1.8.8.tar.bz2
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
./configure --prefix=/usr \
            --host=riscv64-unknown-linux-gnu
# build
build
make -j$(nproc)
# install
install
make install DESTDIR=$BUILDROOT
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
