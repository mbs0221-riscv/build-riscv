#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=samba
export VERSION=4.14.6
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.samba.org/ftp/samba/samba-4.14.6.tar.gz
export SOURCE=samba-4.14.6.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
./configure --prefix=$SYSROOT/usr/ \
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
# path: /usr/
# %defattr(-,root,root,-)
epilog
