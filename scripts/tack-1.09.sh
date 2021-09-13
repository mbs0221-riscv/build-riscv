#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=tack
export VERSION=1.09
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://invisible-mirror.net/archives/ncurses/tack-1.09.tgz
export SOURCE=tack-1.09.tgz
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
#wget https://invisible-mirror.net/archives/ncurses/tack-1.09.tgz
# setup
setup
export CFLAGS="$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses"
export LDFLAGS="$CFLAGS -L$SYSROOT/lib"
./configure --prefix=$SYSROOT/ \
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
# path: /
# %defattr(-,root,root,-)
# %config
# %doc
epilog
