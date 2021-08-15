#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=vim
export VERSION=8.2.2433
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://anduin.linuxfromscratch.org/LFS/vim-8.2.2433.tar.gz
export SOURCE=vim-8.2.2433.tar.gz
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
#wget http://anduin.linuxfromscratch.org/LFS/vim-8.2.2433.tar.gz
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
