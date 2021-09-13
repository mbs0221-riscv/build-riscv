#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libgsf
export VERSION=1.14.47
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://download.gnome.org/sources/libgsf/1.14/libgsf-1.14.47.tar.xz
export SOURCE=libgsf-1.14.47.tar.xz
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
#wget https://download.gnome.org/sources/libgsf/1.14/libgsf-1.14.47.tar.xz
# setup
setup
./configure --prefix=$SYSROOT/usr \
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
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
