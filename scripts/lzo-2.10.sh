#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=lzo
export VERSION=2.10
export URL=https://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz
export SOURCE=lzo-2.10.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
       	    --enable-shared                  \
       	    --disable-static                 \
       	    --docdir=$SYSROOT/usr/share/doc/lzo-2.10
#build
cd $__build_dir_
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
