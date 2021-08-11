#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            http://xmlsoft.org/sources/libxslt-1.1.34.tar.gz
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
sed -i s/3000/5000/ libxslt/transfo
./configure --prefix=$SYSROOT/usr/local/ \
            --host=riscv64-unknown-linux-gnu \
	    --with-sysroot=$SYSROOT \
            --disable-static
make -j8
make install

epilog

