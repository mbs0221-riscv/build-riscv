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

# ppp0 config
ifconfig -a ppp0 txqueuelen 1500

# http proxy
export http_proxy="$IPREMOTE:8889"
export https_proxy="$IPREMOTE:8889"

# normal user
test $(id -u kiki) || \
	echo -e "kimi950221\nkimi950221" | adduser -h /home/kiki -g 'kiki' -s /bin/sh kiki

test $(id -u kimi) || \
	echo -e "kiki950221\nkiki950221" | adduser -h /home/kimi -g 'kimi' -s /bin/sh kimi

# ftp user
test -d /usr/share/empty || mkdir -p /usr/share/empty
test -d /var/ftp || mkdir -p /var/ftp && \
	chown root:root /var/ftp &&\
	chmod og-w /var/ftp

test $(id -u nobody) || \
	adduser -s /usr/sbin/nologin -D -H nobody

test $(id -u ftp) || \
	adduser -h /var/ftp -D -H ftp

# rsyncd user
test $(id -u rsyncd) || \
	addgroup -g 48 rsyncd && \
	adduser -h /home/rsync -g "rsyncd Daemon" -s /bin/false -G rsyncd -D -u 48 rsyncd

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

# ===========================================================
# install init-packages
touch /root/.install
cat /root/.install | sed '/^$/d' | sort | uniq > /root/.install
cat $NFS_ROOT/etc/packages.txt | grep '^*' | sed 's/*//' | sort | uniq > /root/.init-packages
cat $NFS_ROOT/etc/packages.txt | grep -v -E '\*|#|^$' | sort | uniq > /root/.packages

echo "install init-packages" 1>>$STDOUT
grep -F -v -f /root/.install /root/.init-packages | xargs -i rpm -i $RPMS/{}
grep -F -v -f /root/.install /root/.init-packages >> /root/.install

# dropbear
test -e /var/run/dropbear.pid || \
	/usr/sbin/dropbear -E -R -p 2222 1>>$STDOUT 2>>$STDERR && \
	echo dropbear is running 1>>$STDOUT

# generate private key
test -e /root/.ssh/id_dropbear || \
	dropbearkey -t ed25519 -f /root/.ssh/id_dropbear
echo private key is generated 1>>$STDOUT

# send public key
dropbearkey -y -f /root/.ssh/id_dropbear | grep -E "ssh-rsa|ssh-dss|ecdsa-sha2-nistp256|ssh-ed25519" > $NFS_HOME/.ssh/authorized_keys
echo public key is sent 1>>$STDOUT

# test ping
ping -c 3 $PEERNAME
if [ $? -eq 0 ]; then
	cat /etc/hosts 1>>$STDOUT
else
	echo -e "\n$IPREMOTE        $PEERNAME" >> /etc/hosts
	echo "add host: $IPREMOTE $PEERNAME" 1>>$STDOUT
fi

# sync datetime
ntpdate $IPREMOTE 1>>$STDOUT

# install packages
USERNAME=ubuntu

test -d /tmp/rpms || mkdir -p /tmp/rpms

echo "sync and install rpm packages" 1>>$STDOUT
rsync -avzP --files-from=/root/.packages -e 'dbclient -y -p 2222' $USERNAME@$PEERNAME:~/rpmbuild/RPMS/ /tmp/rpms/
grep -F -v -f /root/.install /root/.packages | xargs -i rpm -i /tmp/rpms/x86_64/{}
grep -F -v -f /root/.install /root/.packages >> /root/.install

echo "sync benchmarks" 1>>$STDOUT
test -d /tmp/benchmark || mkdir /tmp/benchmark
rsync -avzP --files-from=$NFS_HOME/benchmark/mibench/rsync.files \
	-e 'dbclient -y -p 2222' $USERNAME@$PEERNAME:~/benchmark/mibench/ /tmp/benchmark/mibench/ 1>>$STDOUT 2>>$STDERR

rsync -avzP --files-from=$NFS_HOME/benchmark/riscv-coremark/rsync.files \
	-e 'dbclient -y -p 2222' $USERNAME@$PEERNAME:~/benchmark/riscv-coremark/ /tmp/benchmark/riscv-coremark/ 1>>$STDOUT 2>>$STDERR

exit 0
