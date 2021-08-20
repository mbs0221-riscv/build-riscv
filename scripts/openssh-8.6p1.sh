#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=openssh
export VERSION=8.6p1
# Release:        1%{?dist}
# Group:          Network
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.6p1.tar.gz
export SOURCE=openssh-8.6p1.tar.gz
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
./configure --prefix=/usr                                \
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
make -j$(nproc)
# install
install
riscv64-unknown-linux-gnu-strip scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan sshd sftp-server ssh-keysign
mkdir -p $SYSROOT/usr/bin
mkdir -p $SYSROOT/usr/sbin
mkdir -p $SYSROOT/usr/libexec
mkdir -p $SYSROOT/usr/etc
cp scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan $SYSROOT/usr/bin
cp sshd $SYSROOT/usr/sbin
cp sftp-server ssh-keysign $SYSROOT/usr/libexec
cp moduli ssh_config sshd_config $SYSROOT/usr/etc
# clean
clean

# %files
# path: /usr/bin
# path: /usr/sbin
# path: /usr/libexec
# %defattr(-,root,root,-)
# %config /usr/etc
# %doc
epilog
