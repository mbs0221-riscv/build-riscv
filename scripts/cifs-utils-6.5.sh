#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://ftp.samba.org/pub/linux-cifs/cifs-utils/cifs-utils-6.5.tar.bz2
#export ROOTSBINDIR=$SYSROOT/sbin
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --disable-pam \
            --disable-systemd 
sed -i '303s/^/\/\//' config.h
sed -i '312s/^/\/\//' config.h
make
sudo make install
sudo 

epilog

