#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=file
export VERSION=5.38
export URL=http://repository.timesys.com/buildsources/f/file/file-5.38/file-5.38.tar.gz
export SOURCE=file-5.38.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
#./configure --prefix=$SYSROOT/usr/local/ \
#            --host=riscv64-unknown-linux-gnu
#make -j8 prefix=$SYSROOT/usr/local && make install prefix=$SYSROOT/usr/local
./configure --prefix=$SYSROOT/usr/local/ \
--host=riscv64-unknown-linux-gnu
cd $__build_dir_
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
