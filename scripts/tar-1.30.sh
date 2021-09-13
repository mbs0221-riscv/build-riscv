#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=tar
export VERSION=1.30
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/gnu/tar/tar-1.30.tar.xz
export SOURCE=tar-1.30.tar.xz
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
#wget http://ftp.gnu.org/gnu/tar/tar-1.30.tar.xz
# setup
setup
./configure --prefix=$BUILDROOT/ \
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
# path: /
# %defattr(-,root,root,-)
# %config
# %doc
epilog
