#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=tzdb
export VERSION=2021a
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://data.iana.org/time-zones/releases/tzdb-2021a.tar.lz
export SOURCE=tzdb-2021a.tar.lz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
prep
# setup
setup
export DESTDIR=$SYSROOT
export CC=riscv64-unknown-linux-gnu-gcc
# build
build
make -j$(nproc)
# install
install
make install DESTDIR=$SYSROOT
# clean
clean

# %files
# path: /usr/bin
# path: /usr/lib
# path: /usr/share
# path: /usr/sbin
# %defattr(-,root,root,-)
# %config /etc
# %doc
epilog
