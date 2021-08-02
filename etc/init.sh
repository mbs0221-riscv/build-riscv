#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

STDOUT=$NFS_ROOT/log/stdout.log
STDERR=$NFS_ROOT/log/stderr.log
export STDERR STDOUT

touch $STDERR $STDOUT
 
# ====================================================
# Download files

ROOTFS=$NFS_ROOT/rootfs
export ROOTFS

cp -r -p $ROOTFS/etc/* /etc/
cp -r -p $ROOTFS/usr/local/etc/* /usr/local/etc/

# ====================================================
# Libnss
# https://www.programmersought.com/article/95981806345/
#cd $NFS_ROOT
#echo sysroot: $SYSROOT 1>$STDOUT 2>$STDERR
#echo find libnss_files 1>$STDOUT 2>$STDERR
#ls -lh $SYSROOT 1>$STDOUT 2>$STDERR
#find ./ -name libnss_* 1>$STDOUT 2>$STDERR
#files=$(find ./ -name libnss_*)
#for file in $files; do
#    echo file: $file 1>$STDOUT 2>$STDERR
#    cp -d -p --parents $file /
#done

#$NFS_ROOT/build/src/getpwnamroot 1>$STDOUT 2>$STDERR

# ====================================================
# Add Users [PASS]

test -d /var/empty || mkdir -p /var/empty
chown 0:0 /var/empty
chmod 000 /var/empty

test $(id -u sshd) || addgroup sshd && \
    adduser -h /var/empty -g 'sshd privsep' -s /usr/sbin/nologin -G sshd -D -H sshd

test $(id -u kiki) || \
    echo -e "kimi950221\nkimi950221" | adduser -h /home/kiki -g 'kiki' -s /bin/sh kiki

test $(id -u kimi) || \
    echo -e "kiki950221\nkiki950221" | adduser -h /home/kimi -g 'kimi' -s /bin/sh kimi

# ====================================================
# authorized_keys

test -d /home/ubuntu/.ssh || mkdir -p /home/ubuntu/.ssh
test -d /home/kiki/.ssh || mkdir -p /home/kiki/.ssh
test -d /root/.ssh || mkdir -p /root/.ssh

cp $NFS_ROOT/authorized_keys /home/ubuntu/.ssh
cp $NFS_ROOT/authorized_keys /home/kiki/.ssh
cp $NFS_ROOT/authorized_keys /root/.ssh

chown ubuntu:ubuntu -R /home/ubuntu/.ssh/
chown kiki:kiki -R /home/kiki/.ssh/
chown root:root -R /root/.ssh/

chmod go-w /home/ubuntu/.ssh
chmod go-w /home/kiki/.ssh
chmod go-w /root/.ssh

touch /home/ubuntu/.ssh/config
touch /home/kiki/.ssh/config

chmod 600 /home/ubuntu/.ssh/config
chmod 600 /home/kiki/.ssh/config

source $NFS_ROOT/etc/keygen.sh

# ====================================================
# Dropbear

killall dropbear
/usr/local/sbin/dropbear -E -R -p 2222 1>$STDOUT 2>$STDERR

# ====================================================
# OpenSSH
    
test -d /chroot || mkdir /chroot \
	chmod g-w /chroot \
	chmod -R 755 /chroot

test $(id -u kiki) || \
    addgroup sftp \
    echo -e "helloworld\nhelloworld" | adduser -h /chroot/kiki -g 'sftp kiki' -s /bin/false -G sftp kiki \
    chown root:root /chroot/kiki \
    chmod 755 /chroot/kiki \
    mkdir -p /chroot/kiki/upload \
    chown sftp_kiki:sftp /chroot/kiki/upload

killall sshd
/usr/local/sbin/sshd & 1>$STDOUT 2>$STDERR

# ====================================================
# FTP Server

test -d /usr/share/empty || mkdir -p /usr/share/empty
test -d /var/ftp || mkdir -p /var/ftp \
    chown root:root /var/ftp \
    chmod og-w /var/ftp

test $(id -u nobody) || \
    adduser -s /usr/sbin/nologin -D -H nobody

test $(id -u ftp) || \
    adduser -h /var/ftp -D -H ftp

chown root:root /etc/vsftpd.conf

killall vsftpd
/usr/local/sbin/vsftpd & 1>$STDOUT 2>$STDERR

# ====================================================
# Upload files
cp -r -p /etc/* $ROOTFS/etc/
cp -r -p /usr/local/etc/* $ROOTFS/usr/local/etc/

exit 0
