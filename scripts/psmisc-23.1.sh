#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=psmisc
export VERSION=23.1
# Release:        1%{?dist}
# Group:          System
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.1.tar.xz
export SOURCE=psmisc-23.1.tar.xz
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
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH
export CFLAGS="$CFLAGS -I$SYSROOT/usr/include -I$SYSROOT/usr/include/ncurses"
export LDFLAGS="$CFLAGS -L$SYSROOT/usr/lib"
./configure --prefix=$BUILDROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
# build
build
sed -i "321s#^#//#" config.h # //#define  malloc  rpl_malloc
sed -i "327s#^#//#" config.h # //#define  realloc  rpl_realloc
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
