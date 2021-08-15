#!/bin/bash
source ../build-utils.sh
export NAME=gpgme
export VERSION=1.16.0
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.16.0.tar.bz2
export SOURCE=gpgme-1.16.0.tar.bz2
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
