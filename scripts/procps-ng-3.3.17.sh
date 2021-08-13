#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=procps
export VERSION=3.3.17
export URL=https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz
export SOURCE=procps-ng-3.3.17.tar.xz
#description
#pre
#post
#prep
#wget https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
export CFLAGS="$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses"
export LDFLAGS="$CFLAGS -L$SYSROOT/lib"
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
#build
cd $__build_dir_
sed -i "394s#^#//#" config.h # //#define  malloc  rpl_malloc
sed -i "400s#^#//#" config.h # //#define  realloc  rpl_realloc
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
