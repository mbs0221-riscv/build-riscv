#!/bin/sh

# ====================================================
# Environment variables
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

ROOTFS=$NFS_ROOT/rootfs
STDOUT=$NFS_ROOT/log/stdout.log
STDERR=$NFS_ROOT/log/stderr.log
RPMS=$NFS_HOME/rpmbuild/RPMS/x86_64

export ROOTFS STDOUT STDERR RPMS
touch $STDERR $STDOUT

# ====================================================
# Route
#route add -net 10.0.5.0/32 netmask 255.255.255.255 gw 10.0.5.1
#route add default ppp0
#route add default gw 10.0.5.1
#route add default ppp0
#route add default gw 10.0.5.3
#route add default ppp0
route -n 1>>$STDOUT 2>>$STDERR

ifconfig -a ppp0 txqueuelen 1500

# ====================================================
# HTTP Proxy
export http_proxy="$IPREMOTE:8889"
export https_proxy="$IPREMOTE:8889"

# ====================================================
# NORMAL USER
test $(id -u kiki) || \
	echo -e "kimi950221\nkimi950221" | adduser -h /home/kiki -g 'kiki' -s /bin/sh kiki

test $(id -u kimi) || \
	echo -e "kiki950221\nkiki950221" | adduser -h /home/kimi -g 'kimi' -s /bin/sh kimi

# FTP USER
test -d /usr/share/empty || mkdir -p /usr/share/empty
test -d /var/ftp || mkdir -p /var/ftp && \
	chown root:root /var/ftp &&\
	chmod og-w /var/ftp

test $(id -u nobody) || \
	adduser -s /usr/sbin/nologin -D -H nobody

test $(id -u ftp) || \
	adduser -h /var/ftp -D -H ftp

# RSYNCD USER
test $(id -u rsyncd) || \
	addgroup -g 48 rsyncd && \
	adduser -h /home/rsync -g "rsyncd Daemon" -s /bin/false -G rsyncd -D -u 48 rsyncd

# ====================================================
# authorized_keys
test -d /home/ubuntu/.ssh || mkdir -p /home/ubuntu/.ssh
test -d /home/kiki/.ssh || mkdir -p /home/kiki/.ssh
test -d /root/.ssh || mkdir -p /root/.ssh 

cp $NFS_ROOT/authorized_keys /home/ubuntu/.ssh
cp $NFS_ROOT/authorized_keys /home/kiki/.ssh
cp $NFS_ROOT/authorized_keys /root/.ssh

chown ubuntu:ubuntu -R /home/ubuntu
chown kiki:kiki -R /home/kiki
chown root:root -R /root

chmod go-w /home/ubuntu/.ssh
chmod go-w /home/kiki/.ssh
chmod go-w /root/.ssh

touch /home/ubuntu/.ssh/config
touch /home/kiki/.ssh/config

chmod 600 /home/ubuntu/.ssh/config
chmod 600 /home/kiki/.ssh/config

# ====================================================
# rsync
test $(which rsync) || \
	rpm -i $RPMS/attr-2.4.47-1.x86_64.rpm && \
        rpm -i $
	rpm -i $RPMS/rsync-3.1.2-1.x86_64.rpm

# dropbear
test $(which dropbear) || \
	rpm -i $RPMS/zlib-1.2.11-1.x86_64.rpm && \
	rpm -i $RPMS/dropbear-2020.81-1.x86_64.rpm

# vsftpd
test $(which vsftpd) || \
	rpm -i vsftpd-3.0.4-1.x86_64.rpm

# ====================================================
# dropbear
test -e /var/run/dropbear.pid || \
	/usr/local/sbin/dropbear -E -R -p 2222 1>>$STDOUT 2>>$STDERR
echo dropbear is running 1>>$STDOUT

# generate private key
test -e /root/.ssh/id_dropbear || \
	dropbearkey -t ed25519 -f /root/.ssh/id_dropbear
echo private key is generated 1>>$STDOUT

# send public key
dropbearkey -y -f /root/.ssh/id_dropbear | grep -E "ssh-rsa|ssh-dss|ecdsa-sha2-nistp256|ssh-ed25519" > $NFS_HOME/.ssh/authorized_keys
echo public key is sent 1>>$STDOUT

# ==================================================== 
# test ping
ping -c 3 $PEERNAME
if [ $? -eq 0 ]; then
	cat /etc/hosts 1>>$STDOUT
else
	echo -e "\n$IPREMOTE        $PEERNAME" >> /etc/hosts
	echo "add host: $IPREMOTE $PEERNAME" 1>>$STDOUT
fi

# ====================================================
# sync and install rpm packages
echo "sync and install rpm packages" 1>>$STDOUT
test -d /var/www/rpms || mkdir -p /var/www/rpms
rsync -avzP -e 'dbclient -y -p 2222' kiki212@$PEERNAME:~/rpmbuild/RPMS/x86_64 /var/www/rpms 1>>$STDOUT 2>>$STDERR

# sync and install rpm packages
#rsync -avzp -e 'dbclient -y -p 2222' ubuntu@$PEERNAME:~/rpmbuild/RPMS/x86_64 --files-from=FILE
#rsync -avzp -e 'dbclient -y -p 2222' kiki212@$PEERNAME:~/rpmbuild/RPMS/x86_64 --files-from=FILE

# sync /lib /usr/lib /usr/local/lib
#export SYSROOT=~/chipyard/riscv-tools-install/sysroot/lib
#rsync -avzP --progress -e 'dbclient -y -p 2222' kiki212@$PEERNAME:~/sysroot/lib          /lib           1>>$STDOUT 2>>$STDERR
#rsync -avzP -e 'dbclient -y -p 2222' kiki212@$PEERNAME:~/sysroot/usr/lib      /usr/lib       1>>$STDOUT 2>>$STDERR
#rsync -avzP -e 'dbclient -y -p 2222' kiki212@$PEERNAME:~/sysroot/usr/locallib /usr/local/lib 1>>$STDOUT 2>>$STDERR

#test -e .install || \
#grep -F -v -f $NFS_ROOT/etc/ignore-packages.txt $NFS_ROOT/etc/packages.txt | sort | uniq | xargs -i rpm -i /var/www/rpms/{} 1>>$STDOUT && \
#	touch .install

#test -e .ntpdate || \
#	ntpdate $IPREMOTE 1>>$STDOUT && \
#	touch .ntpdate

#source $NFS_ROOT/etc/custom.sh

exit 0
