#!/bin/bash

if [ $# != 2 ]; then
	echo "Usage: $0 <busybox install dir> <cpio img path>"
	exit 1
fi

# Prepare
cd $1
mkdir dev sys proc tmp root etc
mkdir dev/pts dev/shm

# $ROOTFS/dev
mount -nvt tmpfs none $ROOTFS/dev

test -e $ROOTFS/dev/console || sudo mknod -m 622 $ROOTFS/dev/console c 5 1
test -e $ROOTFS/dev/null    || sudo mknod -m 666 $ROOTFS/dev/null    c 1 3
test -e $ROOTFS/dev/zero    || sudo mknod -m 666 $ROOTFS/dev/zero    c 1 5
test -e $ROOTFS/dev/ptmx    || sudo mknod -m 666 $ROOTFS/dev/ptmx    c 5 2
test -e $ROOTFS/dev/tty     || sudo mknod -m 666 $ROOTFS/dev/tty     c 5 0
test -e $ROOTFS/dev/tty0    || sudo mknod -m 666 $ROOTFS/dev/tty0    c 4 0
test -e $ROOTFS/dev/tty1    || sudo mknod -m 666 $ROOTFS/dev/tty1    c 4 1
test -e $ROOTFS/dev/tty2    || sudo mknod -m 666 $ROOTFS/dev/tty2    c 4 2
test -e $ROOTFS/dev/random  || sudo mknod -m 444 $ROOTFS/dev/random  c 1 8
test -e $ROOTFS/dev/urandom || sudo mknod -m 444 $ROOTFS/dev/urandom c 1 9
sudo chown -v root:tty $ROOTFS/dev/{console,ptmx,tty}

ln -sv $ROOTFS/proc/self/fd $ROOTFS/dev/fd
ln -sv $ROOTFS/proc/self/fd/0 $ROOTFS/dev/stdin
ln -sv $ROOTFS/proc/self/fd/1 $ROOTFS/dev/stdout
ln -sv $ROOTFS/proc/self/fd/2 $ROOTFS/dev/stderr
ln -sv $ROOTFS/proc/kcore $ROOTFS/dev/core

# pesudo ttys
test -e $ROOTFS/dev/pts || mkdir -v $ROOTFS/dev/pts
test -e $ROOTFS/dev/shm || mkdir -v $ROOTFS/dev/shm

mount devpts $ROOTFS/dev/pts -t devpts

test -d $ROOTFS/var/run || mkdir -p $ROOTFS/var/run

# create a ppp device
test -e $ROOTFS/dev/ppp || sudo mknod -m 666 $ROOTFS/dev/ppp c 108 0

# reate a ttySIF0 device
MAJOR=$(cat $ROOTFS/proc/devices | grep ttySIF | awk '{print $1}')
test -e $ROOTFS/dev/ttySIF0 || sudo mknod -m 666 $ROOTFS/dev/ttySIF0 c $MAJOR 0

sudo sudo mknod -m 660 $ROOTFS/dev/mem     c   1   1
sudo sudo mknod -m 640 $ROOTFS/dev/kmem    c   1   2
sudo chown root:kmem   $ROOTFS/dev/{mem,kmem}
sudo sudo mknod -m 660 $ROOTFS/dev/ram0    b   1   0
sudo chown root:disk   $ROOTFS/dev/ram0 
sudo sudo mknod -m 000 $ROOTFS/dev/pts/ptmx c  5   2
sudo chown root:tty    $ROOTFS/dev/{console,ptmx,tty}

# Create image file
echo "Creating cpio image"

find . | cpio -H newc -o > $2
