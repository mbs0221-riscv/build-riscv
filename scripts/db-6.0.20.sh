#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=db
export VERSION=6.0.20
# Release:        1%{?dist}
# Group:          Database
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://download.oracle.com/berkeley-db/db-6.0.20.tar.gz
export SOURCE=db-6.0.20.tar.gz
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
../dist/configure --prefix=$BUILDROOT/usr \
                  --host=riscv64-unknown-linux-gnu
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
