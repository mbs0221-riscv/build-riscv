#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=util
export VERSION=2.31.1
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.kernel.org/pub/linux/utils/util-linux/v2.31/util-linux-2.31.1.tar.xz
export SOURCE=util-linux-2.31.1.tar.xz
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
#wget https://www.kernel.org/pub/linux/utils/util-linux/v2.31/util-linux-2.31.1.tar.xz
# setup
setup -n util-linux-2.31.1
export CFLAGS="$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses -I$SYSROOT/usr/include -I$SYSROOT/usr/include/readline/"
export LDFLAGS="$CFLAGS -L$SYSROOT/lib -L$SYSROOT/usr/lib"
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --enable-silent-rules \
            --enable-newgrp \
            --enable-write \
            --with-btrfs
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
