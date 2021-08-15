#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=XML-Parser
export VERSION=2.46
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz
export SOURCE=XML-Parser-2.46.tar.gz
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
#wget https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz
# setup
setup
# build
build
export DESTDIR=$SYSROOT/usr/local
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
perl Makefile.PL
     CC=riscv64-unknown-linux-gnu-gcc \
     AR=riscv64-unknown-linux-gnu-ar \
     RANLIB=riscv64-unknown-linux-gnu-ranlib \
     DESTDIR=$SYSROOT/usr/local &&
make
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
