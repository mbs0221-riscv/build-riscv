#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=inih
export VERSION=r53
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/benhoyt/inih/archive/r53/inih-r53.tar.gz
export SOURCE=inih-r53.tar.gz
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
test -d build || mkdir build
cd    build &&
#export CC=riscv64-unknown-linux-gnu-gcc
#export AR=riscv64-unknown-linux-gnu-ar
#export RANLIB=riscv64-unknown-linux-gnu-ranlib
#export STRIP=riscv64-unknown-linux-gnu-strip
meson --prefix=$BUILDROOT/usr --buildtype=release ..
#./configure --prefix=$BUILDROOT/usr \
#            --host=riscv64-unknown-linux-gnu \
# build
build
cd build
ninja
# install
install
cd build
ninja install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
