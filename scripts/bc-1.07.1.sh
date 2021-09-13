#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=bc
export VERSION=1.07.1
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnu.org/gnu/bc/bc-1.07.1.tar.gz
export SOURCE=bc-1.07.1.tar.gz
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
#wget http://ftp.gnu.org/gnu/bc/bc-1.07.1.tar.gz
# setup
setup
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-readline
# build
build
make -j$(nproc)
# install
install
make install-exec-recursive
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
