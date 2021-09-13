#!/bin/bash

if [ $# != 2 ]; then
	echo "Usage: $0 <busybox install dir> <cpio img path>"
	exit 1
fi

# Prepare
cd $1
mkdir dev sys proc tmp root etc
mkdir dev/pts dev/shm

# /dev
mount -nvt tmpfs none /dev

test -e /dev/console || mknod -m 622 $ROOTFS/dev/console c 5 1
test -e /dev/null    || mknod -m 666 $ROOTFS/dev/null    c 1 3
test -e /dev/zero    || mknod -m 666 $ROOTFS/dev/zero    c 1 5
test -e /dev/ptmx    || mknod -m 666 $ROOTFS/dev/ptmx    c 5 2
test -e /dev/tty     || mknod -m 666 $ROOTFS/dev/tty     c 5 0
test -e /dev/tty0    || mknod -m 666 $ROOTFS/dev/tty0    c 4 0
test -e /dev/tty1    || mknod -m 666 $ROOTFS/dev/tty1    c 4 1
test -e /dev/tty2    || mknod -m 666 $ROOTFS/dev/tty2    c 4 2
test -e /dev/random  || mknod -m 444 $ROOTFS/dev/random  c 1 8
test -e /dev/urandom || mknod -m 444 $ROOTFS/dev/urandom c 1 9
chown -v root:tty /dev/{console,ptmx,tty}

ln -sv /proc/self/fd $ROOTFS/dev/fd
ln -sv /proc/self/fd/0 $ROOTFS/dev/stdin
ln -sv /proc/self/fd/1 $ROOTFS/dev/stdout
ln -sv /proc/self/fd/2 $ROOTFS/dev/stderr
ln -sv /proc/kcore $ROOTFS/dev/core

# pettys
test -e /dev/pts || mkdir -v $ROOTFS/dev/pts
test -e /dev/shm || mkdir -v $ROOTFS/dev/shm

mount devpts /dev/pts -t devpts

test -d /var/run || mkdir -p $ROOTFS/var/run

# create a ppp device
test -e /dev/ppp || mknod -m 666 $ROOTFS/dev/ppp c 108 0

# reate a ttySIF0 device
MAJOR=$(cat /proc/devices | grep ttySIF | awk '{print $1}')
test -e /dev/ttySIF0 || mknod -m 666 $ROOTFS/dev/ttySIF0 c $MAJOR 0

mknod -m 660 /dev/mem     c   1   1
mknod -m 640 /dev/kmem    c   1   2
chown root:kmem   /dev/{mem,kmem}
mknod -m 660 /dev/ram0    b   1   0
chown root:disk   /dev/ram0 
mknod -m 000 /dev/pts/ptmx c  5   2
chown root:tty    /dev/{console,ptmx,tty}

# Create image file
echo "Creating cpio image"

find . | cpio -H newc -o > $2
