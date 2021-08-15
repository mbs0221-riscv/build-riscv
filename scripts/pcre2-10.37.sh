#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=pcre2
export VERSION=10.37
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2
export SOURCE=pcre2-10.37.tar.bz2
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
prep
# setup
setup
./configure --prefix=$SYSROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
            --docdir=$SYSROOT/usr/share/doc/pcre2-10.37 \
            --enable-unicode                    \
            --enable-pcre2-16                   \
            --enable-pcre2-32                   \
            --enable-pcre2grep-libz             \
            --enable-pcre2test-libreadline      \
            --disable-static
# build
build
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
