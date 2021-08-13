#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=tzdb
export VERSION=2021a
export URL=https://data.iana.org/time-zones/releases/tzdb-2021a.tar.lz
export SOURCE=tzdb-2021a.tar.lz
#description
#pre
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
export DESTDIR=$SYSROOT
export CC=riscv64-unknown-linux-gnu-gcc
#build
cd $__build_dir_
make -j$(nproc)
#install
cd $__build_dir_
make install DESTDIR=$SYSROOT
#clean

#files
#defattr(-,root,root,-)
#config /etc
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
