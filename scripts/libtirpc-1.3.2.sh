#!/bin/bash
source ../build-utils.sh
export NAME=libtirpc
export VERSION=1.3.2
# Release:        1%{?dist}
# Summary:        The libtirpc package contains libraries that support programs that use the Remote Procedure Call (RPC) API. It replaces the RPC, but not the NIS library entries that used to be in glibc.
# License:        GPLv3+
export URL=https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.2.tar.bz2
export SOURCE=libtirpc-1.3.2.tar.bz2
# Requires(post): info
# Requires(preun): info
# %description
# libtirpc.so provides the Remote Procedure Call (RPC) API functions required by other programs.
prep
setup
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --disable-gssapi \
            --enable-shared
build
make -j$(nproc)
install
make install
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
