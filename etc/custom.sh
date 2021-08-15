#!/bin/sh

# MEMCACHED
memcached -d -m 512 -l 127.0.0.1 -p 10000 -u root

# OPENSSH
test -d /var/empty || \
        mkdir -p /var/empty && \
        chown root:root /var/empty && \
        chmod 000 /var/empty

test $(id -u sshd) || \
	addgroup sshd && \
        adduser -h /var/empty -g 'sshd privsep' -s /usr/sbin/nologin -G sshd -D -H sshd

test -d /chroot || mkdir /chroot && chmod 755 /chroot

test $(id -u kiki) || \
	addgroup sftp && \
    	echo -e "helloworld\nhelloworld" | adduser -h /chroot/kiki -g 'sftp kiki' -s /bin/false -G sftp kiki && \
    	chown root:root /chroot/kiki && \
    	chmod 755 /chroot/kiki && \
    	mkdir -p /chroot/kiki/upload && \
    	chown kiki_sftp:sftp /chroot/kiki/upload

test -e ~/.sshd || \
        /usr/local/sbin/sshd & 1>>$STDOUT 2>>$STDERR && \
        touch ~/.sshd

# NETWORK FILE SYSTEM
test -d /nfsroot || mkdir -p /nfsroot
test -d /var/lib/mnt || mkdir -p /var/lib/nfs
test -e /proc/fs/nfsd || mount -t nfsd nfsd /proc/fs/nfsd

test -e ~/.nfs_server || \
        exportfs -av && \
	rpc.mountd & && \
        rpc.statd --no-notify && \
	rpc.nfsd &

# nghttpd
c-ares-1.17.2-1.x86_64.rpm
jansson-2.13-1.x86_64.rpm
jemalloc-5.2.1-1.x86_64.rpm
libev-4.33-1.x86_64.rpm
libxml2-2.9.12-1.x86_64.rpm
nghttp2-1.44.0-1.x86_64.rpm

exit 0
