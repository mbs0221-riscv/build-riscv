#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=tcl
export VERSION=8.6.8
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://downloads.sourceforge.net/tcl/tcl8.6.8-src.tar.gz
export SOURCE=tcl8.6.8-src.tar.gz
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
#wget https://downloads.sourceforge.net/tcl/tcl8.6.8-src.tar.gz
# setup
setup -n tcl8.6.8
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
# %config
# %doc
epilog
