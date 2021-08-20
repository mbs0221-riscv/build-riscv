#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=bash
export VERSION=5.1.8
# Release:        1%{?dist}
# Group:          System
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
            --host=riscv64-unknown-linux-gnu       \
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
# build
build
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
