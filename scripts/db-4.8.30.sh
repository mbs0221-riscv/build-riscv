#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=db
export VERSION=4.8.30
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://src.fedoraproject.org/repo/pkgs/db4/db-4.8.30.tar.gz/f80022099c5742cd179343556179aa8c/db-4.8.30.tar.gz
export SOURCE=db-4.8.30.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
cd build_unix/
../dist/configure --prefix=$SYSROOT/usr/local \
                  --host=riscv64-unknown-linux-gnu
# build
build
cd build_unix/
make -j$(nproc)
# install
install
cd build_unix/
make install
# clean
clean

# %files
# path: /usr/local
# %defattr(-,root,root,-)
epilog
