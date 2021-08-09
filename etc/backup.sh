#!/bin/bash

# Usage:
#	./etc/backup.sh $ROOTFS
#	./etc/backup.sh ~/backup

BACKUP_DIR=$1

test -d $BACKUP_DIR/etc/           || mkdir -p $BACKUP_DIR/etc/
test -d $BACKUP_DIR/usr/etc/       || mkdir -p $BACKUP_DIR/usr/etc/
test -d $BACKUP_DIR/usr/local/etc/ || mkdir -p $BACKUP_DIR/usr/local/etc/

rsync -a -e dbclient root@10.0.5.2:/etc/           $BACKUP_DIR/etc/
rsync -a -e dbclient root@10.0.5.2:/usr/etc/       $BACKUP_DIR/usr/etc/
rsync -a -e dbclient root@10.0.5.2:/usr/local/etc/ $BACKUP_DIR/usr/local/etc/

#rsync -a -e dbclient kiki212@192.168.0.102,m2@host,martello:/home/matt/ $BACKUP_DIR/
