#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=perl
export VERSION=5.26.1
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://www.cpan.org/src/5.0/perl-5.26.1.tar.xz
export SOURCE=perl-5.26.1.tar.xz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
prep
# setup
setup
sh Configure -Dcc=riscv64-unknown-linux-gnu-gcc \
             -Dprefix=$SYSROOT/opt/perl5 \
             -Dusethreads \
             -Duseshrplib \
# build
build
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /opt
# %defattr(-,root,root,-)
# %config
# %doc
epilog
