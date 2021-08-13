#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=libxml2
export VERSION=2.9.12
export URL=http://xmlsoft.org/sources/libxml2-2.9.12.tar.gz
export SOURCE=libxml2-2.9.12.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
export CFLAGS="$CFLAGS -I$SYSROOT/usr/include/python3.9"
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr/local/ \
--host=riscv64-unknown-linux-gnu \
--disable-static \
--with-history \
--with-regexps \
--with-python=$SYSROOT/usr/bin/python3 &&
make
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
