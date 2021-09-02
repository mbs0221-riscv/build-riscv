#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=lzo
export VERSION=2.10
# Release:        1%{?dist}
# Group:          Compression
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz
export SOURCE=lzo-2.10.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
       	    --enable-shared                  \
       	    --disable-static                 \
       	    --docdir=$BUILDROOT/usr/share/doc/lzo-2.10
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
