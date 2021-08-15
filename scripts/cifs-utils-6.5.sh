#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=cifs-utils
export VERSION=6.5
# Release:        1%{?dist}
# Summary:        The cifs-utils provides a means for mounting SMB/CIFS shares on a Linux system.
# License:        GPLv3+
export URL=https://ftp.samba.org/pub/linux-cifs/cifs-utils/cifs-utils-6.5.tar.bz2
export SOURCE=cifs-utils-6.5.tar.bz2
# Requires(post): info
# Requires(preun): info
# %description
# pre
prep
# setup
setup
#export ROOTSBINDIR=$SYSROOT/sbin
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --disable-pam \
            --disable-systemd
# build
build
sed -i '303s/^/\/\//' config.h
sed -i '312s/^/\/\//' config.h
make
# install
install
sudo make install
# clean
clean
sudo 
# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
