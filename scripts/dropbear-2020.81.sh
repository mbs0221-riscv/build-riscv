#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=dropbear
export VERSION=2020.81
export URL=https://matt.ucc.asn.au/dropbear/releases/dropbear-2020.81.tar.bz2
export SOURCE=dropbear-2020.81.tar.bz2
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/local \
--host=riscv64-unknown-linux-gnu \
--with-zlib=$SYSROOT/usr
cd $__build_dir_
make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" SCPPROGRESS=1 strip
cd $__build_dir_
make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" SCPPROGRESS=1 install
#ln -s /usr/local/bin/dbclient /usr/bin/dbclient
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
