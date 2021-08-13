#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=ncurses
export VERSION=6.2
export URL=http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
export SOURCE=ncurses-6.2.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
#./configure --prefix=$ROOTFS --host=riscv64-unknown-linux-gnu --without-cxx --without-cxx-binding --without-ada --without-progs --without-tests --with-shared
./configure --prefix=$SYSROOT \
--host=riscv64-unknown-linux-gnu \
--without-cxx \
--without-cxx-binding \
--without-ada \
--without-progs \
--without-tests \
--with-shared &&
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
