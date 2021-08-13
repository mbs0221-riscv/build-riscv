#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=bash
export VERSION=5.1.8
export URL=https://ftp.gnu.org/gnu/bash/bash-5.1.8.tar.gz
export SOURCE=bash-5.1.8.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
sed -i '81c STRIP ?= strip' Makefile.in
./configure --prefix=$SYSROOT                 \
--target=riscv64-unknown-linux-gnu     \
--host=riscv64-unknown-linux-gnu       \
--build=x86_64-linux-gnu               \
--with-curses                          \
--with-installed-readline              \
--with-included-gettext                \
--enable-alias                         \
--enable-prompt-string-decoding        \
--enable-minimal-config                \
--enable-array-variables               \
--enable-function-import               \
--enable-brace-expansion               \
--enable-select
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
export STRIP=riscv64-unknown-linux-gnu-strip
cd $__build_dir_
export STRIP=riscv64-unknown-linux-gnu-strip
make -j8 strip
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
