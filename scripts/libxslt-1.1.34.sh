#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libxslt
export VERSION=1.1.34
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://xmlsoft.org/sources/libxslt-1.1.34.tar.gz
export SOURCE=libxslt-1.1.34.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
sed -i s/3000/5000/ libxslt/transform.c doc/xsltproc.1 doc/xsltproc.xml
sed -i -r '/max(Parser)?Depth/d' ./tests/fuzz/fuzz.c &&
./configure --prefix=$SYSROOT/usr/local/ \
            --host=riscv64-unknown-linux-gnu \
	    --with-sysroot=$SYSROOT \
            --with-python=$SYSROOT/usr \
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
epilog
