#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://ftp.osuosl.org/pub/blfs/conglomeration/nfs-utils/nfs-utils-2.5.3.tar.xz
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr 
            --host=riscv64-unknown-linux-gnu 
            --enable-silent-rules 
            --enable-shared 
            --disable-gss 
            --disable-nfsv4 
            --disable-nfsv41 
            --disable-uuid && 
make -j8
sudo make install                          &&
sudo chmod u+w,go+r /usr/sbin/mount.nfs    &&
sudo chown nobody.nogroup /var/lib/nfs
sudo 
