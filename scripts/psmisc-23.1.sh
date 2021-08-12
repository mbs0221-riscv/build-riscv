#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.1.tar.xz
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH
export CFLAGS="$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses"
export LDFLAGS="$CFLAGS -L$SYSROOT/lib"
./configure --prefix=$SYSROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
sed -i "321s#^#//#" config.h # //#define  malloc  rpl_malloc
sed -i "327s#^#//#" config.h # //#define  realloc  rpl_realloc
make -j$(nproc)
make install

epilog

