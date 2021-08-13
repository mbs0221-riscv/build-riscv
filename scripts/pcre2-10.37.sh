#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=pcre2
export VERSION=10.37
export URL=https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2
export SOURCE=pcre2-10.37.tar.bz2
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/ \
--host=riscv64-unknown-linux-gnu \
--docdir=$SYSROOT/usr/share/doc/pcre2-10.37 \
--enable-unicode                    \
--enable-pcre2-16                   \
--enable-pcre2-32                   \
--enable-pcre2grep-libz             \
--enable-pcre2test-libreadline      \
--disable-static
cd $__build_dir_
make -j$(nproc)
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
