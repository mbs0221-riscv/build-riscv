#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libtool
export VERSION=2.4.6
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz
export SOURCE=libtool-2.4.6.tar.xz
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
# build
build
make -j$(nproc)
# install
install
make install
# # libtool: warning: remember to run 'libtool --finish /home/kiki212/rpmbuild/BUILDROOT/libtool-2.4.6-1.riscv64/usr/lib'
# libtool --finish $SYSROOT/usr/lib
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
