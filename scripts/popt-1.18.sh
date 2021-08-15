#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=popt
export VERSION=1.18
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://ftp.osuosl.org/pub/blfs/conglomeration/popt/popt-1.18.tar.gz
export SOURCE=popt-1.18.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
./configure --prefix=$SYSROOT/usr/local \
            --host=riscv64-unknown-linux-gnu \
# build
build
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /usr/local
# %defattr(-,root,root,-)
epilog
