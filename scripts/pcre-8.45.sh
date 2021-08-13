#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=pcre
export VERSION=8.45
export URL=https://ftp.pcre.org/pub/pcre/pcre-8.45.tar.bz2
export SOURCE=pcre-8.45.tar.bz2
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/ \
--host=riscv64-unknown-linux-gnu \
--docdir=$SYSROOT/usr/share/doc/pcre-8.45 \
--enable-unicode-properties       \
--enable-pcre16                   \
--enable-pcre32                   \
--enable-pcregrep-libz            \
--disable-static
cd $__build_dir_
make -j$(nproc)
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
