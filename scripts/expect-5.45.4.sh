#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=expect
export VERSION=5.45.4
export URL=http://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz
export SOURCE=expect5.45.4.tar.gz
#description
#pre
#post
#prep
#wget http://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup/
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
export __build_dir_=$BUILD/expect5.45.4
cd $__build_dir_
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
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
