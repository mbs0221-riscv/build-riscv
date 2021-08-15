#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=procps-ng
export VERSION=3.3.17
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz
export SOURCE=procps-ng-3.3.17.tar.xz
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
#wget https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz
# setup
setup -n procps-3.3.17
export CFLAGS="$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses"
export LDFLAGS="$CFLAGS -L$SYSROOT/lib"
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
# build
build
sed -i "394s#^#//#" config.h # //#define  malloc  rpl_malloc
sed -i "400s#^#//#" config.h # //#define  realloc  rpl_realloc
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
