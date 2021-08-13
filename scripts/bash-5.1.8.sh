#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=bash
export VERSION=5.1.8
export URL=https://ftp.gnu.org/gnu/bash/bash-5.1.8.tar.gz
export SOURCE=bash-5.1.8.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
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
#build
cd $__build_dir_
export STRIP=riscv64-unknown-linux-gnu-strip
make -j$(nproc) strip
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
#doc /share/doc
test $? -eq 0 || exit 0
cd $__build_dir_
