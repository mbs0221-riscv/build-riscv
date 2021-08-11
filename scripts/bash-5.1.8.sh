#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            https://ftp.gnu.org/gnu/bash/bash-5.1.8.tar.gz
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
export STRIP=riscv64-unknown-linux-gnu-strip
make -j8 strip
make install

epilog

