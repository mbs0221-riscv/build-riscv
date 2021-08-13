#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=libevent
export VERSION=2.1.12
export URL=https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
export SOURCE=libevent-2.1.12-stable.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=export __build_dir_=$NAME-$VERSION -n libevent-2.1.12-stable
cd $__build_dir_
cd $__build_dir_
sed -i 's/python/&3/' event_rpcgen.py
./configure --prefix=$SYSROOT/usr                     \
--host=riscv64-unknown-linux-gnu               \
--enable-shared                                &&
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
