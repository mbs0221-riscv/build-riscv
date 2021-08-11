#!/bin/bash

BACKUP_DIR=~/backup

echo restore backup in $BACKUP_DIR
rsync -azvP -e 'dbclient -p 2222' root@vc709:/etc/           $BACKUP_DIR/etc/
rsync -azvp -e 'dbclient -p 2222' root@vc709:/usr/etc/       $BACKUP_DIR/usr/etc/
rsync -azvp -e 'dbclient -p 2222' root@vc709:/usr/local/etc/ $BACKUP_DIR/usr/local/etc/
rsync -azvP -e 'dbclient -p 2222' root@vc709:/root/          $BACKUP_DIR/root/
rsync -azvP -e 'dbclient -p 2222' root@vc709:/home/          $BACKUP_DIR/home/
