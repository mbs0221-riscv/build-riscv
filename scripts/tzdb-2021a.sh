#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=tzdb
export VERSION=2021a
export URL=https://data.iana.org/time-zones/releases/tzdb-2021a.tar.lz
export SOURCE=tzdb-2021a.tar.lz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
export DESTDIR=$SYSROOT
export CC=riscv64-unknown-linux-gnu-gcc
cd $__build_dir_
make -j$(nproc)
cd $__build_dir_
make install DESTDIR=$SYSROOT
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
