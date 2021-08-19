#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=openldap
export VERSION=2.4.39
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-2.4.39.tgz
export SOURCE=openldap-2.4.39.tgz
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
# setup
setup
export CFLAGS="$CFLAGS -I$SYSROOT/usr/local/include"
export LDFLAGS="$LDFLAGS -L$SYSROOT/usr/local/lib"
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
# build
build
export CFLAGS="$CFLAGS -I$SYSROOT/usr/local/include"
export LDFLAGS="$LDFLAGS -L$SYSROOT/usr/local/lib"
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
