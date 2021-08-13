#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=openssh
export VERSION=8.6p1
export URL=https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.6p1.tar.gz
export SOURCE=openssh-8.6p1.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
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
cd $__build_dir_
riscv64-unknown-linux-gnu-strip scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan sshd sftp-server ssh-keysign
mkdir -p $SYSROOT/usr/local/bin
mkdir -p $SYSROOT/usr/local/sbin
mkdir -p $SYSROOT/usr/local/libexec
mkdir -p $SYSROOT/usr/local/etc
cp scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan $SYSROOT/usr/local/bin
cp sshd $SYSROOT/usr/local/sbin
cp sftp-server ssh-keysign $SYSROOT/usr/local/libexec
cp moduli ssh_config sshd_config $SYSROOT/usr/local/etc
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
