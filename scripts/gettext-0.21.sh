#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=gettext
export VERSION=0.21
export URL=http://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz
export SOURCE=gettext-0.21.tar.xz
#wget http://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
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
