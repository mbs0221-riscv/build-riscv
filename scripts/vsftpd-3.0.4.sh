#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://src.fedoraproject.org/repo/pkgs/lrzsz/lrzsz-0.12.20.tar.gz/b5ce6a74abc9b9eb2af94dffdfd372a4/lrzsz-0.12.20.tar.gz
sed -i 2c CC?=gcc Makefile
make CC=riscv64-unknown-linux-gnu-gcc
mkdir -p $SYSROOT/etc
mkdir -p $SYSROOT/usr/local/sbin/
mkdir -p $SYSROOT/usr/local/man/man5
mkdir -p $SYSROOT/usr/local/man/man8
install -m 755 vsftpd        $SYSROOT/usr/local/sbin/vsftpd
install -m 644 vsftpd.conf.5 $SYSROOT/usr/local/man/man5
install -m 644 vsftpd.8      $SYSROOT/usr/local/man/man8
install -m 664 vsftpd.conf   $SYSROOT/etc
