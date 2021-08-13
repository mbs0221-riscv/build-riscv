#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=vsftpd
export VERSION=3.0.4
export URL=https://src.fedoraproject.org/repo/pkgs/lrzsz/lrzsz-0.12.20.tar.gz/b5ce6a74abc9b9eb2af94dffdfd372a4/lrzsz-0.12.20.tar.gz
export SOURCE=vsftpd-3.0.4.tar.gz
#description
#pre
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#build
cd $__build_dir_
sed -i '2c CC?=gcc' Makefile
make CC=riscv64-unknown-linux-gnu-gcc
#install
cd $__build_dir_
mkdir -p $SYSROOT/etc
mkdir -p $SYSROOT/usr/local/sbin/
mkdir -p $SYSROOT/usr/local/man/man5
mkdir -p $SYSROOT/usr/local/man/man8
install -m 755 vsftpd        $SYSROOT/usr/local/sbin/vsftpd
install -m 644 vsftpd.conf.5 $SYSROOT/usr/local/man/man5
install -m 644 vsftpd.8      $SYSROOT/usr/local/man/man8
install -m 664 vsftpd.conf   $SYSROOT/etc
#clean

#files
#defattr(-,root,root,-)
#config /etc/*
test $? -eq 0 || exit 0
cd $__build_dir_
