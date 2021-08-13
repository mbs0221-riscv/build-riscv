#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=psmisc
export VERSION=23.1
export URL=https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.1.tar.xz
export SOURCE=psmisc-23.1.tar.xz
#description
#pre
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH
export CFLAGS="$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses"
export LDFLAGS="$CFLAGS -L$SYSROOT/lib"
./configure --prefix=$SYSROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
#build
cd $__build_dir_
sed -i "321s#^#//#" config.h # //#define  malloc  rpl_malloc
sed -i "327s#^#//#" config.h # //#define  realloc  rpl_realloc
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
