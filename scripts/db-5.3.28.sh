#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=db
export VERSION=5.3.28
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://anduin.linuxfromscratch.org/BLFS/bdb/db-5.3.28.tar.gz
export SOURCE=db-5.3.28.tar.gz
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
cd build_unix
../dist/configure --prefix=$SYSROOT/usr \
           --host=riscv64-unknown-linux-gnu \
           --enable-compat185 \
           --enable-dbm       \
           --disable-static   \
           --enable-cxx
# build
build
cd build_unix
make -j$(nproc)
# install
install
cd build_unix
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
