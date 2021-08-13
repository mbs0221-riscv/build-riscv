#!/bin/bash

echo =========ports:======================
nc -zv 10.0.5.2 2222  # dropbear
nc -zv 10.0.5.2 22    # openssh
nc -zv 10.0.5.2 21    # vsftpd
nc -zv 10.0.5.2 6379  # redis
nc -zv 10.0.5.2 10000 # memcached
