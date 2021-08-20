#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=rpcbind
export VERSION=1.2.6
# Release:        1%{?dist}
# Group:          Network
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.6.tar.bz2
export SOURCE=rpcbind-1.2.6.tar.bz2
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
sed -i "/servname/s:rpcbind:sunrpc:" src/rpcbind.c
patch -Np1 -i %{?_sourcedir}/rpcbind-1.2.6-vulnerability_fixes-1.patch &&
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr                    \
            --bindir=$SYSROOT/usr/sbin               \
            --host=riscv64-unknown-linux-gnu               \
            --with-rpcuser=root                            \
            --with-systemdsystemunitdir=no
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
