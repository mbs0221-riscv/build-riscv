#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=libxml2
export VERSION=2.9.12
export URL=http://xmlsoft.org/sources/libxml2-2.9.12.tar.gz
export SOURCE=libxml2-2.9.12.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#build
cd $__build_dir_
export CFLAGS="$CFLAGS -I$SYSROOT/usr/include/python3.9"
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr/local/ \
            --host=riscv64-unknown-linux-gnu \
            --disable-static \
            --with-history \
            --with-regexps \
            --with-python=$SYSROOT/usr/bin/python3 &&
make
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
