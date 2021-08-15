#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=axel
export VERSION=2.17.10
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/axel-download-accelerator/axel/releases/download/v2.17.10/axel-2.17.10.tar.xz
export SOURCE=axel-2.17.10.tar.xz
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
#wget https://github.com/axel-download-accelerator/axel/releases/download/v2.17.10/axel-2.17.10.tar.xz
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
