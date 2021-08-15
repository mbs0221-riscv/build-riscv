#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=bash
export VERSION=5.1.8
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://ftp.gnu.org/gnu/bash/bash-5.1.8.tar.gz
export SOURCE=bash-5.1.8.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
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
# build
build
export STRIP=riscv64-unknown-linux-gnu-strip
make -j$(nproc) strip
# install
install
make install
# clean
clean

# %files
# path: /bin
# path: /include
# path: /lib
# path: /share/info
# path: /share/locale
# path: /share/man
# %defattr(-,root,root,-)
# %doc /share/doc
epilog
