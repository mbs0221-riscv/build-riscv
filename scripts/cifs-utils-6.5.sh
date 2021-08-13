#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=cifs-utils
export VERSION=6.5
export URL=https://ftp.samba.org/pub/linux-cifs/cifs-utils/cifs-utils-6.5.tar.bz2
export SOURCE=cifs-utils-6.5.tar.bz2
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#export ROOTSBINDIR=$SYSROOT/sbin
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --disable-pam \
            --disable-systemd
#build
cd $__build_dir_
sed -i '303s/^/\/\//' config.h
sed -i '312s/^/\/\//' config.h
make
#install
cd $__build_dir_
sudo make install
#clean
sudo 
#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
