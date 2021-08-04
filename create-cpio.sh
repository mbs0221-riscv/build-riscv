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

test -e /dev/console || mknod -m 622 /dev/console c 5 1
test -e /dev/null    || mknod -m 666 /dev/null    c 1 3
test -e /dev/zero    || mknod -m 666 /dev/zero    c 1 5
test -e /dev/ptmx    || mknod -m 666 /dev/ptmx    c 5 2
test -e /dev/tty     || mknod -m 666 /dev/tty     c 5 0
test -e /dev/tty0    || mknod -m 666 /dev/tty0    c 4 0
test -e /dev/tty1    || mknod -m 666 /dev/tty1    c 4 1
test -e /dev/tty2    || mknod -m 666 /dev/tty2    c 4 2
test -e /dev/random  || mknod -m 444 /dev/random  c 1 8
test -e /dev/urandom || mknod -m 444 /dev/urandom c 1 9
chown -v root:tty /dev/{console,ptmx,tty}

ln -sv /proc/self/fd /dev/fd
ln -sv /proc/self/fd/0 /dev/stdin
ln -sv /proc/self/fd/1 /dev/stdout
ln -sv /proc/self/fd/2 /dev/stderr
ln -sv /proc/kcore /dev/core

# pesudo ttys
test -e /dev/pts || mkdir -v /dev/pts
test -e /dev/shm || mkdir -v /dev/shm

mount devpts /dev/pts -t devpts

test -d /var/run || mkdir -p /var/run

# create a ppp device
test -e /dev/ppp || mknod -m 666 /dev/ppp c 108 0

# reate a ttySIF0 device
MAJOR=$(cat /proc/devices | grep ttySIF | awk '{print $1}')
test -e /dev/ttySIF0 || mknod -m 666 /dev/ttySIF0 c $MAJOR 0

cd dev/
sudo mknod -m 660 mem     c   1   1
sudo mknod -m 640 kmem    c   1   2
sudo chown root:kmem {mem,kmem}
sudo mknod -m 660 dev/ram0    b   1   0
sudo chown root:disk dev/ram0 
sudo mknod -m 000 pts/ptmx c  5   2
sudo chown root:tty {console,ptmx,tty}
cd ..

# Create image file
echo "Creating cpio image"

find . | cpio -H newc -o > $2
