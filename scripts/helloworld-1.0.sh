#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=helloworld
export VERSION=1.0
export URL=https://blog.packagecloud.io
export SOURCE=helloworld-1.0.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#build
cd $__build_dir_
make PREFIX=/usr #{?_smp_mflags}
#install
cd $__build_dir_
make PREFIX=/usr DESTDIR=$SYSROOT install
#clean

#files
#{_bindir}/helloworld
test $? -eq 0 || exit 0
cd $__build_dir_
