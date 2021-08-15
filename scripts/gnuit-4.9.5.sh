#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=gnuit
export VERSION=4.9.5
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://ftp.gnu.org/gnu/git/gnuit-4.9.5.tar.gz
export SOURCE=gnuit-4.9.5.tar.gz
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
#wget https://ftp.gnu.org/gnu/git/gnuit-4.9.5.tar.gz
# setup
setup
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --enable-smp
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
