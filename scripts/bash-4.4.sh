#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=bash
export VERSION=4.4
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/gnu/bash/bash-4.4.tar.gz
export SOURCE=bash-4.4.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
post
# pre
prep
# setup
setup
sed -i '78a STRIP = @STRIP@' Makefile.in
sed -i '596s/strip/$(STRIP)/g' Makefile.in
sed -i '633a AC_CHECK_TOOL(STRIP, strip)' Makefile.in
#sed -i '637a AC_PROG_STRIP' configure.ac
./configure --prefix=$SYSROOT                    \
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
# path: /
# %defattr(-,root,root,-)
# %config
# %doc
epilog
