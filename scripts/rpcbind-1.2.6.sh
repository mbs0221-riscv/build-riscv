#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=rpcbind
export VERSION=1.2.6
export URL=https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.6.tar.bz2
export SOURCE=rpcbind-1.2.6.tar.bz2
#description
rpcbind is a server that converts RPC program numbers into universal addresses. It must be running on the host to be able to make RPC calls on a server on that machine.
rpcinfo	makes an RPC call to an RPC server and reports data according to the requested options.
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
sed -i "/servname/s:rpcbind:sunrpc:" src/rpcbind.c
patch -Np1 -i #{?_sourcedir}/rpcbind-1.2.6-vulnerability_fixes-1.patch &&
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr                     \
            --host=riscv64-unknown-linux-gnu               \
            --bindir=$SYSROOT/usr/sbin                \
            --with-rpcuser=root                            \
            --with-systemdsystemunitdir=no
#build
cd $__build_dir_
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
