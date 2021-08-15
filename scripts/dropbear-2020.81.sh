#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=dropbear
export VERSION=2020.81
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://matt.ucc.asn.au/dropbear/releases/dropbear-2020.81.tar.bz2
export SOURCE=dropbear-2020.81.tar.bz2
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
./configure --prefix=$SYSROOT/usr/local \
            --host=riscv64-unknown-linux-gnu \
            --with-zlib=$SYSROOT/usr
# build
build
make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" SCPPROGRESS=1 strip
# install
install

make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" SCPPROGRESS=1 install
#ln -s /usr/local/bin/dbclient /usr/bin/dbclient
# clean
clean

# %files
# path: /usr/local/bin
# path: /usr/local/sbin
# %defattr(-,root,root,-)
# %doc /usr/local/share
epilog
