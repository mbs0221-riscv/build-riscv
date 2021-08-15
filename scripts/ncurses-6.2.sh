#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=ncurses
export VERSION=6.2
# Release:        1%{?dist}
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
#./configure --prefix=$ROOTFS --host=riscv64-unknown-linux-gnu --without-cxx --without-cxx-binding --without-ada --without-progs --without-tests --with-shared
./configure --prefix=$SYSROOT \
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
# clean
clean

# %files
# path: /
# %defattr(-,root,root,-)
epilog
