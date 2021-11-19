#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libical
export VERSION=3.0.10
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/libical/libical/releases/download/v3.0.10/libical-3.0.10.tar.gz
export SOURCE=libical-3.0.10.tar.gz
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
PKG_CONFIG_PATH=$SYSROOT/lib/pkgconfig:$PKG_CONFIG_PATH
PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH
mkdir build
cd    build
cmake -DCMAKE_INSTALL_PREFIX=/usr  \
      -DCMAKE_C_COMPILER=riscv64-unknown-linux-gnu-gcc \
      -DCMAKE_CXX_COMPILER=riscv64-unknown-linux-gnu-g++ \
      -DCMAKE_BUILD_TYPE=Release   \
      -DSHARED_ONLY=yes            \
      -DICAL_BUILD_DOCS=false      \
      -DICAL_GLIB_VAPI=false       \
      -DICAL_GLIB=false \
      -DGOBJECT_INTROSPECTION=false \
      -DENABLE_GTK_DOC=false \
      -DLIBICAL_BUILD_TESTING=false \
      ..
# build
build
cd build
make
# install
install
cd build
make install DESTDIR=$BUILDROOT
# clean
clean

# %files
# path: /
# %defattr(-,root,root,-)
# %config
# %doc
epilog
