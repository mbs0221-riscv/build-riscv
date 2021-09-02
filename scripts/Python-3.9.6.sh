#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=Python
export VERSION=3.9.6
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=url
export SOURCE=Python-3.9.6.tgz
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
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
#export CFLAGS="$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses -I$SYSROOT/usr/local/include"
#export LDFLAGS="$CFLAGS -L$SYSROOT/lib -L$SYSROOT/usr/local/lib"
export CFLAGS="$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses"
export LDFLAGS="$CFLAGS -L$SYSROOT/lib"
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
#./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu --build=riscv64 --enable-shared --disable-ipv6 --enable-loadable-sqlite-extensions --enable-optimizations ac_cv_file__dev_ptc=no  ac_cv_file__dev_ptmx=no && make -j$(nproc)
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --build=riscv64 \
            --enable-shared \
            --disable-ipv6 \
            --enable-loadable-sqlite-extensions \
            --enable-optimizations \
            ac_cv_file__dev_ptc=no \
            ac_cv_file__dev_ptmx=no &&
make -j$(nproc)
#./configure --prefix=$SYSROOT/usr \
#            --host=riscv64-unknown-linux-gnu \
#            --build=riscv64 \
#            --enable-shared \
#            --disable-ipv6 \
#            --enable-loadable-sqlite-extensions \
#            --enable-optimizations \
#            ac_cv_file__dev_ptc=no \
#            ac_cv_file__dev_ptmx=no &&
#make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
