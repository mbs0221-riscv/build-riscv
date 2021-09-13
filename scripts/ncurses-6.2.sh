#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=ncurses
export VERSION=6.2
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
export SOURCE=ncurses-6.2.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
# build
build
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --without-cxx \
            --without-cxx-binding \
            --without-ada \
            --without-progs \
            --without-tests \
            --with-shared &&
make -j$(nproc)
# install
install
make install
cd $BUILDROOT/usr/lib
ln -s libncurses.so.6 libtinfo.so.6
ln -s libtinfo.so.6 libtinfo.so
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
