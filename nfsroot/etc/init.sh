#!/bin/sh

ROOTFS=$NFS_HOME/riscv-linux/rootfs
export ROOTFS

STDOUT=$NFS_ROOT/stdout.log
STDERR=$NFS_ROOT/stderr.log
export STDERR STDOUT

touch STDERR STDOUT

# ====================================================
# Upload files

cp -r $ROOTFS/etc/* /etc/
cp -r $ROOTFS/usr/local/etc/* /usr/local/etc/

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

$NFS_ROOT/src/getpwnamroot 1>$STDOUT 2>$STDERR

# ====================================================
# Add Users [PASS]

test -d /var/empty || mkdir -p /var/empty
chown 0:0 /var/empty
chmod 000 /var/empty

test $(id -u sshd) || \
    addgroup sshd 1>$STDOUT 2>$STDERR \
    adduser -h /var/empty -g 'sshd privsep' -s /usr/sbin/nologin -G sshd -D -H sshd 1>$STDOUT 2>$STDERR

test $(id -u kiki) || \
    echo -e "kimi950221\nkimi950221" | adduser -h /home/kiki -g 'kiki' -s /bin/sh kiki 1>$STDOUT 2>$STDERR

test $(id -u kimi) || \
    echo -e "kiki950221\nkiki950221" | adduser -h /home/kimi -g 'kimi' -s /bin/sh kimi 1>$STDOUT 2>$STDERR

# ====================================================
# authorized_keys

cp $NFS_ROOT/authorized_keys /home/ubuntu/.ssh
cp $NFS_ROOT/authorized_keys /home/kiki/.ssh
cp $NFS_ROOT/authorized_keys /root/.ssh

chown root:root -R /root/.ssh/
chown ubuntu:ubuntu -R /home/ubuntu/.ssh/
chown kiki:kiki -R /home/kiki/.ssh/

chmod go-w /home/ubuntu/.ssh
chmod go-w /home/kiki/.ssh
chmod go-w /root/.ssh

touch /home/ubuntu/.ssh/config
touch /home/kiki/.ssh/config

chmod 600 /home/ubuntu/.ssh/config
chmod 600 /home/kiki/.ssh/config

# ====================================================
# Dropbear

killall dropbear
/usr/local/sbin/dropbear -E -R -p 2222 1>$STDOUT 2>$STDERR

#/etc/init.d/dropbear stop
#/etc/init.d/dropbear start ecdsa
#/etc/init.d/dropbear status >> $LOG_FILE

# ====================================================
# OpenSSH
    
test -d /chroot || mkdir /chroot \
    chmod g-w /chroot \
    chmod -R 755 /chroot

#test $(id -u kiki) || \
#    addgroup sftp \
#    echo -e "helloworld\nhelloworld" | adduser -h /chroot/kiki -g 'sftp kiki' -s /bin/false -G sftp kiki 1>$STDOUT 2>$STDERR \
#    chown root:root /chroot/kiki \
#    chmod 755 /chroot/kiki
#    mkdir -p /chroot/kiki/upload
#    chown sftp_kiki:sftp /chroot/kiki/upload

killall sshd
/usr/local/sbin/sshd & 1>$STDOUT 2>$STDERR

#/etc/init.d/openssh stop
#/etc/init.d/openssh start ecdsa
#/etc/init.d/openssh status >> $LOG_FILE

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

killall vsftpd
/usr/local/sbin/vsftpd & 1>$STDOUT 2>$STDERR

#/etc/init.d/vsftpd stop
#/etc/init.d/vsftpd start
#/etc/init.d/vsftpd status 1>>$STDOUT 2>>$STDERR

exit 0
