#!/bin/bash
source ../build-utils.sh
export NAME=libgcrypt
export VERSION=1.8.8
# Release:        1%{?dist}
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
./configure --prefix=$SYSROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
            --with-sysroot=$SYSROOT \
            --with-libgpg-error-prefix=$SYSROOT/usr
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
