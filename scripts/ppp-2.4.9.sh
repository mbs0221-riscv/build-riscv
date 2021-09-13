#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=ppp
export VERSION=2.4.9
# Release:        1%{?dist}
# Group:          Network
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://download.samba.org/pub/ppp/ppp-2.4.9.tar.gz
export SOURCE=ppp-2.4.9.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
./configure --prefix=$SYSROOT/usr \
            --sysconfdir=$SYSROOT/etc \
            --cc=riscv64-unknown-linux-gnu-gcc \
            --cross-compile=riscv64-unknown-linux-gnu \
            --sysconf=$SYSROOT/etc
# build
build
make -j$(nproc)
# install
install
make install
make install-etcppp
# clean
clean

# %files
# path: /usr/include
# path: /usr/lib
# path: /usr/sbin
# %defattr(-,root,root,-)
# %config /etc
# %doc /usr/share
epilog
