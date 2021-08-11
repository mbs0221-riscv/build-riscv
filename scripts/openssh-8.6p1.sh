#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.6p1.tar.gz
./configure --prefix=/usr/local                          \
            --host=riscv64-unknown-linux-gnu             \
            --with-libs                                  \
            --with-zlib=$SYSROOT/usr                     \
            --with-ssl-dir=$SYSROOT/usr                  \
            --with-privsep-path=/var/empty               \
            --with-privsep-user=sshd                     \
            --with-ssl-engine                            \
            --with-md5-passwords                         \
            --disable-etc-default-login
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export STRIP=riscv64-unknown-linux-gnu-strip
make -j12
riscv64-unknown-linux-gnu-strip scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan sshd sftp-server ssh-keysign
mkdir -p $SYSROOT/usr/local/bin
mkdir -p $SYSROOT/usr/local/sbin
mkdir -p $SYSROOT/usr/local/libexec
mkdir -p $SYSROOT/usr/local/etc
cp scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan $SYSROOT/usr/local/bin
cp sshd $SYSROOT/usr/local/sbin
cp sftp-server ssh-keysign $SYSROOT/usr/local/libexec
cp moduli ssh_config sshd_config $SYSROOT/usr/local/etc

epilog

