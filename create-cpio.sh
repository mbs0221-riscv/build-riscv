#!/bin/bash

if [ $# != 2 ]; then
	echo "Usage: $0 <busybox install dir> <cpio img path>"
	exit 1
fi

# Prepare
cd $1
mkdir dev sys proc tmp root etc
mkdir dev/pts dev/shm

cd dev
sudo mknod -m 622 console c 5 1
sudo mknod -m 666 null    c 1 3
sudo mknod -m 666 zero    c 1 5
sudo mknod -m 666 ptmx    c 5 2
sudo mknod -m 444 random  c 1 8
sudo mknod -m 444 urandom c 1 9
sudo mknod -m 666 tty         c   5   0
sudo mknod -m 666 tty0        c   4   0
sudo mknod -m 666 tty1        c   4   1
sudo mknod -m 666 tty2        c   4   2
sudo mknod -m 666 dev/ppp     c 108   0
sudo mknod -m 666 dev/ttySIF0 c 250   0
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
