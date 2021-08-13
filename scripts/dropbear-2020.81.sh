#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=dropbear
export VERSION=2020.81
export URL=https://matt.ucc.asn.au/dropbear/releases/dropbear-2020.81.tar.bz2
export SOURCE=dropbear-2020.81.tar.bz2
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/local \
            --host=riscv64-unknown-linux-gnu \
            --with-zlib=$SYSROOT/usr
#build
cd $__build_dir_
make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" SCPPROGRESS=1 strip
#install
cd $__build_dir_

make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" SCPPROGRESS=1 install
#ln -s /usr/local/bin/dbclient /usr/bin/dbclient
#clean

#files
#defattr(-,root,root,-)
#doc /usr/local/share
test $? -eq 0 || exit 0
cd $__build_dir_
