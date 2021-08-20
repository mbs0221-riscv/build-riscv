#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=e2fsprogs
export VERSION=1.43.9
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.43.9/e2fsprogs-1.43.9.tar.gz
export SOURCE=e2fsprogs-1.43.9.tar.gz
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
#wget http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.43.9/e2fsprogs-1.43.9.tar.gz
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
