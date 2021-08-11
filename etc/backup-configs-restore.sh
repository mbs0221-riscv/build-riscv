#!/bin/bash

# Usage:
#	./etc/backup.sh $ROOTFS
#	./etc/backup.sh ~/backup

BACKUP_DIR=~/backup
echo restore backup in $BACKUP_DIR

rsync -azvP $BACKUP_DIR/etc -e 'dbclient -p 2222' root@10.0.5.2:/etc
rsync -azvP $BACKUP_DIR/usr/etc -e 'dbclient -p 2222' root@10.0.5.2:/usr/etc
rsync -azvP $BACKUP_DIR/usr/local/etc -e 'dbclient -p 2222' root@10.0.5.2:/usr/local/etc

