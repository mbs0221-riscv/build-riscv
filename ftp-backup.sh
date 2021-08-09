#!/bin/bash

ftp -n<<!
open vc709
user ubuntu helloworld
binary
hash
cd /var/www
lcd /home/kiki212/rpmbuild/RPMS/x86_64
prompt
mkdir `date +"%Y%m%d"`
cd `date +"%Y%m%d"`
mput *
close
bye
!
