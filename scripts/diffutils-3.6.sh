#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=diffutils
export VERSION=3.6
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/gnu/diffutils/diffutils-3.6.tar.xz
export SOURCE=diffutils-3.6.tar.xz
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
#wget http://ftp.gnu.org/gnu/diffutils/diffutils-3.6.tar.xz
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
