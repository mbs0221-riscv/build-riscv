#!/bin/bash

test -d ~/backup/etc/           || mkdir -p ~/backup/etc/
test -d ~/backup/usr/etc/       || mkdir -p ~/backup/usr/etc/
test -d ~/backup/usr/local/etc/ || mkdir -p ~/backup/usr/local/etc/

rsync -a -e dbclient root@10.0.5.2:/etc/           ~/backup/etc/
rsync -a -e dbclient root@10.0.5.2:/usr/etc/       ~/backup/usr/etc/
rsync -a -e dbclient root@10.0.5.2:/usr/local/etc/ ~/backup/usr/local/etc/

#rsync -a -e dbclient kiki212@192.168.0.102,m2@host,martello:/home/matt/ ~/backup/
