#!/bin/bash

cd ~/rpmbuild/RPMS/x86_64

rpm -qpl bash-5.1.8-1.x86_64.rpm | sed 's/^/\/nfsroot\/rootfs/g' | xargs -i rm -f {}
rpm -qpl dropbear-2020.81-1.x86_64.rpm | sed 's/^/\/nfsroot\/rootfs/g' | xargs -i rm -f {}
rpm -qpl helloworld-1.0-1.x86_64.rpm  | sed 's/^/\/nfsroot\/rootfs/g' | xargs -i rm -f {}
rpm -qpl htop-2.2.0-1.x86_64.rpm | sed 's/^/\/nfsroot\/rootfs/g' | xargs -i rm -f {}
rpm -qpl lrzsz-0.12.20-1.x86_64.rpm  | sed 's/^/\/nfsroot\/rootfs/g' | xargs -i rm -f {}
rpm -qpl nfs-utils-2.5.3-1.x86_64.rpm | sed 's/^/\/nfsroot\/rootfs/g' | xargs -i rm -f {}
rpm -qpl ntp-4.2.8p15-1.x86_64.rpm  | sed 's/^/\/nfsroot\/rootfs/g' | xargs -i rm -f {}
rpm -qpl openssh-8.6p1-1.x86_64.rpm  | sed 's/^/\/nfsroot\/rootfs/g' | xargs -i rm -f {}
rpm -qpl rpcbind-1.2.6-1.x86_64.rpm | sed 's/^/\/nfsroot\/rootfs/g' | xargs -i rm -f {}
rpm -qpl vsftpd-3.0.4-1.x86_64.rpm | sed 's/^/\/nfsroot\/rootfs/g' | xargs -i rm -f {}

# history | grep 'rpm -qpl' | awk '{$1=""; print $0}' | sort | uniq
# cat process.sh | grep rpm | sort | uniq
