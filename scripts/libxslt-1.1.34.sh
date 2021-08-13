#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=libxslt
export VERSION=1.1.34
export URL=http://xmlsoft.org/sources/libxslt-1.1.34.tar.gz
export SOURCE=libxslt-1.1.34.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
sed -i s/3000/5000/ libxslt/transform.c doc/xsltproc.1 doc/xsltproc.xml
./configure --prefix=$SYSROOT/usr/local/ \
--host=riscv64-unknown-linux-gnu \
--with-sysroot=$SYSROOT \
--disable-static
cd $__build_dir_
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
