#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=db
export VERSION=4.8.30
export URL=https://src.fedoraproject.org/repo/pkgs/db4/db-4.8.30.tar.gz/f80022099c5742cd179343556179aa8c/db-4.8.30.tar.gz
export SOURCE=db-4.8.30.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd build_unix/
../dist/configure --prefix=$SYSROOT/usr/local \
--host=riscv64-unknown-linux-gnu
cd $__build_dir_
cd build_unix/
make -j8
cd $__build_dir_
cd build_unix/
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
