#!/bin/sh

# Environment variables
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

ROOTFS=$NFS_ROOT/rootfs
STDOUT=$NFS_ROOT/log/stdout.log
STDERR=$NFS_ROOT/log/stderr.log
RPMS=$NFS_HOME/rpmbuild/RPMS/x86_64

export ROOTFS STDOUT STDERR RPMS
touch $STDERR $STDOUT

# route
route -n 1>>$STDOUT 2>>$STDERR

# http proxy
export http_proxy="$IPREMOTE:8889"
export https_proxy="$IPREMOTE:8889"

# ===========================================================
# authorized_keys

cp $NFS_ROOT/authorized_keys /home/ubuntu/.ssh
cp $NFS_ROOT/authorized_keys /home/kiki/.ssh
cp $NFS_ROOT/authorized_keys /home/kimi/.ssh
cp $NFS_ROOT/authorized_keys /root/.ssh

# ===========================================================
# install init-packages
touch /root/.install
cat /root/.install | sed '/^$/d' | sort | uniq > /root/.install
cat $NFS_ROOT/etc/packages.txt | grep '^*' | sed 's/*//' | sort | uniq > /root/.init-packages
cat $NFS_ROOT/etc/packages.txt | grep -v -E '\*|#|^$' | sort | uniq > /root/.packages

echo "install init-packages:" 1>>$STDOUT
grep -F -v -f /root/.install /root/.init-packages 1>>$STDOUT
grep -F -v -f /root/.install /root/.init-packages | xargs -i rpm -i $RPMS/{}
grep -F -v -f /root/.install /root/.init-packages >> /root/.install

# send public key
#dropbearkey -y -f /root/.ssh/id_dropbear | grep -E "ssh-rsa|ssh-dss|ecdsa-sha2-nistp256|ssh-ed25519"

# install packages
USERNAME=ubuntu

exit 0
