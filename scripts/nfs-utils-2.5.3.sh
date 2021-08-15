#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=nfs-utils
export VERSION=2.5.3
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://ftp.osuosl.org/pub/blfs/conglomeration/nfs-utils/nfs-utils-2.5.3.tar.xz
export SOURCE=nfs-utils-2.5.3.tar.xz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
# build
build
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --enable-silent-rules \
            --enable-shared \
            --disable-gss \
            --disable-nfsv4 \
            --disable-nfsv41 \
            --disable-uuid &&
make -j$(nproc)
# install
install
sudo make install                          &&
sudo chmod u+w,go+r /usr/sbin/mount.nfs    &&
sudo chown nobody.nogroup /var/lib/nfs
# clean
clean
sudo 
# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
