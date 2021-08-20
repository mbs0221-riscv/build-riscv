#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=pptpd
export VERSION=1.4.0
# Release:        1%{?dist}
# Group:          Network
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://sourceforge.net/projects/poptop/files/pptpd/pptpd-1.4.0/pptpd-1.4.0.tar.gz
export SOURCE=pptpd-1.4.0.tar.gz
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
# setup
setup
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
# build
build
make -j$(nproc)
# install
install
sudo make install
# clean
clean
sudo 
# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
