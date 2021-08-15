#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=acl
export VERSION=2.2.52
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://download.savannah.gnu.org/releases/acl/acl-2.2.52.src.tar.gz
export SOURCE=acl-2.2.52.src.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# # A helloworld program from the packagecloud.io blog!
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
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
