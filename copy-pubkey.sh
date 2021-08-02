#!/bin/bash

SSH_ROOT=$1

#dropbearkey -t rsa -s 1024 -f dropbear_rsa_host_key
#dropbearkey -t dss -f dropbear_dss_host_key
#dropbearkey -t ecdsa -f dropbear_ecdsa_host_key
#dropbearkey -t ed25519 -f dropbear_ed25519_host_key

test -f $SSH_ROOT/dropbear_rsa_host_key || dropbearkey -t rsa -s 1024 -f $SSH_ROOT/dropbear_rsa_host_key
test -f $SSH_ROOT/dropbear_dss_host_key || dropbearkey -t dss -f $SSH_ROOT/dropbear_dss_host_key
test -f $SSH_ROOT/dropbear_ecdsa_host_key || dropbearkey -t ecdsa -f $SSH_ROOT/dropbear_ecdsa_host_key
test -f $SSH_ROOT/dropbear_ed25519_host_key || dropbearkey -t ed25519 -f $SSH_ROOT/dropbear_ed25519_host_key

dropbearkey -y -f $SSH_ROOT/dropbear_rsa_host_key
dropbearkey -y -f $SSH_ROOT/dropbear_dss_host_key
dropbearkey -y -f $SSH_ROOT/dropbear_ecdsa_host_key
dropbearkey -y -f $SSH_ROOT/dropbear_ed25519_host_key

#./copy-pubkey.sh ~/.ssh/ | grep -E "ssh-rsa|ssh-dss|ecdsa-sha2-nistp256|ssh-ed25519" > /nfsroot/authorized_keys

