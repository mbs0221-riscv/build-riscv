#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=helloworld
export VERSION=1.0
# Release:        1%{?dist}
# Group:          Benchmark
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://blog.packagecloud.io
export SOURCE=helloworld-1.0.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
# build
build
make PREFIX=/usr
# install
install
make PREFIX=/usr DESTDIR=$BUILDROOT install
# clean
clean

# %files
# %{_bindir}/helloworld
epilog
