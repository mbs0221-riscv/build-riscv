#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=module-init-tools
export VERSION=3.15
# Release:        1%{?dist}
# Group:          System
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://mirrors.edge.kernel.org/pub/linux/utils/kernel/module-init-tools/module-init-tools-3.15.tar.gz
export SOURCE=module-init-tools-3.15.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
sudo apt install -y docbook-utils docbook-to-man
# setup
setup
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
./configure --prefix=$SYSROOT \
            --host=riscv64-unknown-linux-gnu \
            --enable-zlib &&
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /
# %defattr(-,root,root,-)
epilog
