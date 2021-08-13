#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=perl
export VERSION=5.26.1
export URL=http://www.cpan.org/src/5.0/perl-5.26.1.tar.xz
export SOURCE=perl-5.26.1.tar.xz
#description
#pre
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
export export LD_LIBRARY_PATH=$SYSROOT/lib:$SYSROOT/usr/lib:$SYSROOT/usr/local/lib$LD_LIBRARY_PATH
sh Configure -Dcc=riscv64-unknown-linux-gnu-gcc \
             -Dprefix=$SYSROOT/opt/perl5 \
             -Dusethreads \
             -Duseshrplib \
#build
cd $__build_dir_
make -j$(nproc)
make -j$(nproc) test
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
