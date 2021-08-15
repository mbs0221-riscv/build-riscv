#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=eudev
export VERSION=3.2.5
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://dev.gentoo.org/~blueness/eudev/eudev-3.2.5.tar.gz
export SOURCE=eudev-3.2.5.tar.gz
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
#wget http://dev.gentoo.org/~blueness/eudev/eudev-3.2.5.tar.gz
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
