#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=file
export VERSION=5.38
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://repository.timesys.com/buildsources/f/file/file-5.38/file-5.38.tar.gz
export SOURCE=file-5.38.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
#./configure --prefix=$SYSROOT/usr/local/ \
#            --host=riscv64-unknown-linux-gnu
#make -j$(nproc) prefix=$SYSROOT/usr/local && make install prefix=$SYSROOT/usr/local
./configure --prefix=$SYSROOT/usr/local/ \
            --host=riscv64-unknown-linux-gnu
# build
build
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /usr/local/
# %defattr(-,root,root,-)
epilog
