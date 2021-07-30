#!/bin/bash

SSH_ROOT=$1

test -f $SSH_ROOT/dropbear_rsa_host_key || dropbearkey -t rsa -s 1024 -f $SSH_ROOT/dropbear_rsa_host_key
test -f $SSH_ROOT/dropbear_dss_host_key || dropbearkey -t dss -f $SSH_ROOT/dropbear_dss_host_key
test -f $SSH_ROOT/dropbear_ecdsa_host_key || dropbearkey -t ecdsa -f $SSH_ROOT/dropbear_ecdsa_host_key
test -f $SSH_ROOT/dropbear_ed25519_host_key || dropbearkey -t ed25519 -f $SSH_ROOT/dropbear_ed25519_host_key

dropbearkey -y -f $SSH_ROOT/dropbear_rsa_host_key
dropbearkey -y -f $SSH_ROOT/dropbear_dss_host_key
dropbearkey -y -f $SSH_ROOT/dropbear_ecdsa_host_key
dropbearkey -y -f $SSH_ROOT/dropbear_ed25519_host_key

# sudo ./copy-pubkey.sh /etc/dropbear | grep -E "ssh-rsa|ssh-dss|ecdsa-sha2-nistp256|ssh-ed25519" > authorized_keys
# ./copy-pubkey.sh ~/.ssh/ | grep -E "ssh-rsa|ssh-dss|ecdsa-sha2-nistp256|ssh-ed25519" >> authorized_keys
# cp authorized_keys root/.ssh/
# cp authorized_keys home/ubuntu/.ssh/authorized_keys