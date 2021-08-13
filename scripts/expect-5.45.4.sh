#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=expect
export VERSION=5.45.4
export URL=http://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz
export SOURCE=expect5.45.4.tar.gz
#wget http://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=export __build_dir_=$NAME-$VERSION -n expect5.45.4
cd $__build_dir_
./configure --prefix=$SYSROOT/usr \
--host=riscv64-unknown-linux-gnu \
cd $__build_dir_
make -j$(nproc)
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
