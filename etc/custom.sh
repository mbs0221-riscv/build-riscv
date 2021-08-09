#!/bin/sh

export NFS_HOME=/mnt/nfs/home
export RPMS=$NFS_HOME/rpmbuild/RPMS/x86_64
export NFS_ROOT=/nfsroot

# ====================================================
# Download RPM packages
cp -p $RPMS/*.rpm $NFS_ROOT
cd $NFS_ROOT

# ====================================================
# LIBRARY
rpm -i libffi-3.4.2-1.x86_64.rpm
rpm -i liblinear-243-1.x86_64.rpm
rpm -i gperf-3.1-1.x86_64.rpm
rpm -i libseccomp-2.5.1-1.x86_64.rpm
rpm -i liblinear-243-1.x86_64.rpm
rpm -i json-c-0.15-1.x86_64.rpm

# APPLICATIONS
test $(which htop) || rpm -i $RPMS/htop-2.2.0-1.x86_64.rpm
test $(which bash) || rpm -i $RPMS/bash-5.1.8-1.x86_64.rpm
test $(which lrz)  || rpm -i $RPMS/lrzsz-0.12.20-1.x86_64.rpm

# OPENSSH
test -d /var/empty || \
        mkdir -p /var/empty \
        chown root:root /var/empty \
        chmod 000 /var/empty

test $(id -u sshd) || addgroup sshd && \
        adduser -h /var/empty -g 'sshd privsep' -s /usr/sbin/nologin -G sshd -D -H sshd

# SFTP [XX]
test -d /chroot || mkdir /chroot \
        chmod 755 /chroot

#test $(id -u sftp_user) || addgroup sftp && \
#    echo -e "helloworld\nhelloworld" | adduser -h /chroot/kiki -g 'sftp kiki' -s /bin/false -G sftp kiki && \
#    chown root:root /chroot/kiki && \
#    chmod 755 /chroot/kiki && \
#    mkdir -p /chroot/kiki/upload && \
#    chown kiki_sftp:sftp /chroot/kiki/upload

# OpenSSH Service
test $(which sshd) || \
        cp /usr/local/etc/ssh_config /usr/local/etc/ssh_config_old && \
        cp /usr/local/etc/sshd_config /usr/local/etc/sshd_config_old && \
        rpm -i $RPMS/openssh-8.6p1-1.x86_64.rpm && \
        cp /usr/local/etc/sshd_config_old /usr/local/etc/sshd_config && \
        cp /usr/local/etc/ssh_config_old /usr/local/etc/ssh_config && \
        /usr/local/sbin/sshd & 1>>$STDOUT 2>>$STDERR

# NTP Service
test $(which ntpdate) || \
        rpm -i $RPMS/ntp-4.2.8p15-1.x86_64.rpm && \
        /usr/local/bin/ntpdate 10.0.5.1 &

# NFS Service
# https://www.cnblogs.com/misfit/p/10552547.html
# https://blog.csdn.net/ken_yjj/article/details/6821372
# https://www.linuxquestions.org/questions/linux-newbie-8/don%27t-have-nfsd-mount-point-in-proc-fs-nfsd-can%27t-start-nfs-as-a-result-684401/
# https://groups.google.com/a/lbl.gov/g/warewulf/c/cxEFa3_MkXA
test $(which exportfs) || \
        rpm -i $RPMS/libuuid-1.0.3-1.x86_64.rpm && \
        rpm -i $RPMS/libnfsidmap-0.25-1.x86_64.rpm && \
        rpm -i $RPMS/libtirpc-1.3.2-1.x86_64.rpm && \
        rpm -i $RPMS/rpcbind-1.2.6-1.x86_64.rpm && \
        rpm -i $RPMS/nfs-utils-2.5.3-1.x86_64.rpm
        mount -t nfsd nfsd /proc/fs/nfsd 
# 	mount -t nfsd /proc/fs/nfsd &
#	portmap
	mkdir -p /var/lib/nfs/
	mkdir -p /nfsroot
	exportfs -av ; rpc.mountd 
 	rpc.statd --no-notify 
 	rpc.nfsd
 	sm-notify

exit 0
