#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=libgcrypt
export VERSION=1.8.8
export URL=https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.8.tar.bz2
export SOURCE=libgcrypt-1.8.8.tar.bz2
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/ \
--host=riscv64-unknown-linux-gnu \
--with-sysroot=$SYSROOT \
--with-libgpg-error-prefix=$SYSROOT/usr
cd $__build_dir_
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
