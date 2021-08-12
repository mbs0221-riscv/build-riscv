#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.6.tar.bz2
rpcbind is a server that converts RPC program numbers into universal addresses. It must be running on the host to be able to make RPC calls on a server on that machine.
rpcinfo	makes an RPC call to an RPC server and reports data according to the requested options.
sed -i "/servname/s:rpcbind:sunrpc:" src/rpcbind.c
patch -Np1 -i %{?_sourcedir}/rpcbind-1.2.6-vulnerability_fixes-1.patch &&
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr                     \
            --host=riscv64-unknown-linux-gnu               \
            --bindir=$SYSROOT/usr/sbin                \
            --with-rpcuser=root                            \
            --with-systemdsystemunitdir=no
make -j8
make install

epilog

