#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=rpcbind
export VERSION=1.2.6
# Release:        1%{?dist}
# Summary:        The rpcbind program is a replacement for portmap. It is required for import or export of Network File System (NFS) shared directories.
# License:        GPLv3+
export URL=https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.6.tar.bz2
export SOURCE=rpcbind-1.2.6.tar.bz2
# Requires(post): info
# Requires(preun): info
# %description
# rpcbind is a server that converts RPC program numbers into universal addresses. It must be running on the host to be able to make RPC calls on a server on that machine.
# rpcinfo	makes an RPC call to an RPC server and reports data according to the requested options.
# pre
prep
# setup
setup
sed -i "/servname/s:rpcbind:sunrpc:" src/rpcbind.c
patch -Np1 -i $SOURCES/rpcbind-1.2.6-vulnerability_fixes-1.patch &&
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr                     \
            --host=riscv64-unknown-linux-gnu               \
            --bindir=$SYSROOT/usr/sbin                \
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
