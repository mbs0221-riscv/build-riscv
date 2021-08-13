#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=libyaml
export VERSION=0.2.5
export URL=https://github.com/yaml/libyaml/archive/0.2.5/libyaml-0.2.5.tar.gz
export SOURCE=libyaml-0.2.5.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./bootstrap &&
./configure --prefix=$SYSROOT/usr/local \
--host=riscv64-unknown-linux-gnu \
--disable-static
cd $__build_dir_
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
