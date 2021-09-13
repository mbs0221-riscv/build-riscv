#/bin/bash

rsync -avzP ~/rpmbuild/RPMS  -e 'dbclient -p 2222' root@vc709:/tmp/rpmbuild
rsync -avzP ~/rpmbuild/SPECS -e 'dbclient -p 2222' root@vc709:/tmp/rpmbuild

iptables -i INPUT -p tcp --dport 873 -j ACCEPT
rsync --zvrtopg --password-file=/etc/rsyncd.secretes --progress rsync@vc709 100qslogbak /home/rsync/log/
