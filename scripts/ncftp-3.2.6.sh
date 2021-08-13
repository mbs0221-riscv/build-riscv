#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=ncftp
export VERSION=3.2.6
export URL=https://www.ncftp.com/downloads/ncftp/ncftp-3.2.6-src.tar.gz
export SOURCE=ncftp-3.2.6-src.tar.gz
#description
#pre
#post
#prep
#wget https://www.ncftp.com/downloads/ncftp/ncftp-3.2.6-src.tar.gz
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/local \
            --host=riscv64-unknown-linux-gnu \
#build
cd $__build_dir_
make -j$(nproc)
#install
cd $__build_dir_
make DESTDIR=$SYSROOT/usr/local install
#clean

#files
#defattr(-,root,root,-)
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
