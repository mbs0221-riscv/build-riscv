#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=rpcbind
export VERSION=1.2.6
export URL=https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.6.tar.bz2
export SOURCE=rpcbind-1.2.6.tar.bz2
rpcbind is a server that converts RPC program numbers into universal addresses. It must be running on the host to be able to make RPC calls on a server on that machine.
rpcinfo	makes an RPC call to an RPC server and reports data according to the requested options.
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
sed -i "/servname/s:rpcbind:sunrpc:" src/rpcbind.c
patch -Np1 -i %{?_sourcedir}/rpcbind-1.2.6-vulnerability_fixes-1.patch &&
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr                     \
--host=riscv64-unknown-linux-gnu               \
--bindir=$SYSROOT/usr/sbin                \
--with-rpcuser=root                            \
--with-systemdsystemunitdir=no
cd $__build_dir_
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
