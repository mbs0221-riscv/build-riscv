#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=kmod
export VERSION=25
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-25.tar.xz
export SOURCE=kmod-25.tar.xz
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
#wget https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-25.tar.xz
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
