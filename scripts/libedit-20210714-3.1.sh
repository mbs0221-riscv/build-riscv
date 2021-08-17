#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libedit-20210714
export VERSION=3.1
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://thrysoee.dk/editline/libedit-20210714-3.1.tar.gz
export SOURCE=libedit-20210714-3.1.tar.gz
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
export CFLAGS="$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses"
export LDFLAGS="$CFLAGS -L$SYSROOT/lib"
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
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
