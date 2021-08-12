#!/bin/sh

# ====================================================
# Environment variables
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib

ETC=$NFS_ROOT/etc
ROOTFS=$NFS_ROOT/rootfs
STDOUT=$NFS_ROOT/log/stdout.log
STDERR=$NFS_ROOT/log/stderr.log
RPMS=$NFS_HOME/rpmbuild/RPMS/x86_64

export ETC ROOTFS STDOUT STDERR RPMS
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

ifconfig -a ppp0 txqueuelen 1000

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
#test $(id -u rsyncd) || \
#	addgroup -g 48 rsyncd && \
#	adduser -h /home/rsync -g "rsyncd Daemon" -s /bin/false -G rsyncd -D -u 48 rsyncd

# ====================================================
# authorized_keys
test -d /home/ubuntu/.ssh || mkdir -p /home/ubuntu/.ssh
test -d /home/kiki/.ssh || mkdir -p /home/kiki/.ssh
test -d /root/.ssh || mkdir -p /root/.ssh 

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
test $(which rsync) || echo "install rsync" 1>>$STDOUT 2>>$STDERR && \
        rpm -i $RPMS/rsync-3.1.2-1.x86_64.rpm

# dropbear
test $(which dropbear) || echo "install dropbear" 1>>$STDOUT 2>>$STDERR && \
	rpm -i $RPMS/zlib-1.2.11-1.x86_64.rpm && \
	rpm -i $RPMS/dropbear-2020.81-1.x86_64.rpm && \
	/usr/local/sbin/dropbear -E -R -p 2222 1>>$STDOUT 2>>$STDERR
	
# keygen key for current user
test -e ~/.ssh/id_dropbear || \
        dropbearkey -t ed25519 -f ~/.ssh/id_dropbear && \
	dropbearkey -y -f ~/.ssh/id_dropbear | grep -E 'ssh-ed25519' >> $NFS_HOME/.ssh/authorized_keys

# extract public key from host
dropbearkey -y -f $NFS_HOME/.ssh/id_dropbear | grep -E "ssh-rsa|ssh-dss|ecdsa-sha2-nistp256|ssh-ed25519" > ~/.ssh/authorized_keys

# setup remote user
case "$IPREMOTE" in
	10.0.5.2)
		export USERREMOTE=ubuntu
		;;
	10.0.5.3)
		export USERREMOTE=kiki212
		;;
	*)
		;;
esac

# run helloworld
test $(which helloworld) && helloworld 1>>$STDOUT 2>>$STDERR

# rsync packages
test -e ~/.rsync || echo "rsync configs and packages" 1>>$STDOUT 2>>$STDERR && \
	rsync -azvpP -e 'dbclient -y -p 2222' $USERREMOTE@$PEERNAME:~/rpmbuild/RPMS ~/rpmbuild/RPMS 1>>$STDOUT 2>>$STDERR && \
	touch ~/.rsync && echo "rsync configs and packages finished" 1>>$STDOUT 2>>$STDERR

# install library
export RPMS_DIR=~/rpmbuild/RPMS/x86_64
test -e ~/.install || echo "install library" 1>>$STDOUT 2>>$STDERR && \
	test -d $RPMS_DIR || mkdir -p $RPMS_DIR && cd $RPMS_DIR && \
	grep -F -v -f $ETC/ignore-packages.txt $ETC/packages.txt | sort | uniq | xargs -i rpm -i ~/rpmbuild/RPMS{} & 1>>$STDOUT 2>>$STDERR && \
	touch ~/.install && echo "install packages finished" 1>>$STDOUT 2>>$STDERR

test -e ~/.ntpdate || \
	ntpdate $IPREMOTE & 1>>$STDOUT 2>>$STDERR &&
	touch ~/.ntpdate

source $NFS_ROOT/etc/custom.sh

exit 0
