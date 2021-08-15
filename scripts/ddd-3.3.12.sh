#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=ddd
export VERSION=3.3.12
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://ftp.gnu.org/gnu/ddd/ddd-3.3.12.tar.gz
export SOURCE=ddd-3.3.12.tar.gz
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
#wget https://ftp.gnu.org/gnu/ddd/ddd-3.3.12.tar.gz
# setup
setup
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --x-includes=$SYSROOT/usr/include/p11-kit-1 \
            --x-libraries=$SYSROOT/usr/lib
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
