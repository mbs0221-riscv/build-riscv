#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=procps
export VERSION=3.3.17
export URL=https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz
export SOURCE=procps-ng-3.3.17.tar.xz
#wget https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
export CFLAGS="$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses"
export LDFLAGS="$CFLAGS -L$SYSROOT/lib"
./configure --prefix=$SYSROOT/usr \
--host=riscv64-unknown-linux-gnu \
cd $__build_dir_
sed -i "394s#^#//#" config.h # //#define  malloc  rpl_malloc
sed -i "400s#^#//#" config.h # //#define  realloc  rpl_realloc
make -j$(nproc)
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
