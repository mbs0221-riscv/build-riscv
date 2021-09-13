#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=xxx
export VERSION=1.0.0
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=url
export SOURCE=source0
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
#wget url
# setup
setup
export DESTDIR=$SYSROOT$prefix
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
# build
build
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
$prefix
# %defattr(-,root,root,-)
# %config
# %doc
epilog
