#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libyaml
export VERSION=0.2.5
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/yaml/libyaml/archive/0.2.5/libyaml-0.2.5.tar.gz
export SOURCE=libyaml-0.2.5.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
./bootstrap &&
./configure --prefix=$SYSROOT/usr/local \
            --host=riscv64-unknown-linux-gnu \
            --disable-static
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
# %config
# %doc
epilog
