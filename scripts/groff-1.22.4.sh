#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=groff
export VERSION=1.22.4
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz
export SOURCE=groff-1.22.4.tar.gz
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
#wget http://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz
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
