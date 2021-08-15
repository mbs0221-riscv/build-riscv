#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=node
export VERSION=v16.6.2
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/v16.6.2/node-v16.6.2.tar.gz
export SOURCE=node-v16.6.2.tar.gz
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
#wget https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/v16.6.2/node-v16.6.2.tar.gz
# setup
setup
./configure --prefix=$SYSROOT/usr/local \
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
# path: /usr/local
# %defattr(-,root,root,-)
# %config
# %doc
epilog
