#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libpcap
export VERSION=1.9.1
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://www.us.tcpdump.org/release/libpcap-1.9.1.tar.gz
export SOURCE=libpcap-1.9.1.tar.gz
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
            --target=riscv64-unknown-linux-gnu \
            --with-pcap=linux
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
