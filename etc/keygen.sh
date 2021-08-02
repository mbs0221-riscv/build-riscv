#!/bin/sh

# ====================================================
# Dropbear

test -d /etc/dropbear || mkdir /etc/dropbear

test -e /etc/dropbear/dropbear_rsa_host_key || \
        dropbearkey -t rsa -s 1024 -f /etc/dropbear/dropbear_rsa_host_key \
        cp -p /etc/dropbear/dropbear_rsa_host_key $ROOTFS/etc/dropbear

test -e /etc/dropbear/dropbear_dss_host_key || \
        dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key \
        cp -p /etc/dropbear/dropbear_dss_host_key $ROOTFS/etc/dropbear

test -e /etc/dropbear/dropbear_ecdsa_host_key || \
        dropbearkey -t ecdsa -f /etc/dropbear/dropbear_ecdsa_host_key \
        cp -p /etc/dropbear/dropbear_ecdsa_host_key $ROOTFS/etc/dropbear

test -e /etc/dropbear/dropbear_ed25519_host_key || \
        dropbearkey -t ed25519 -f /etc/dropbear/dropbear_ed25519_host_key \
        cp -p /etc/dropbear/dropbear_ed25519_host_key $ROOTFS/etc/dropbear

# ====================================================
# OpenSSH

test -d /etc/ssh/ || mkdir /etc/ssh

test -e /etc/ssh/ssh_host_rsa_key || \
        ssh-keygen -t rsa -b 1024 -f /etc/ssh/ssh_host_rsa_key -P "" \
        cp -p /etc/ssh/ssh_host_rsa_key $ROOTFS/etc/ssh/

test -e /etc/ssh/ssh_host_dsa_key || \
        ssh-keygen -t dsa -b 1024 -f /etc/ssh/ssh_host_dsa_key -P "" \
        cp -p /etc/ssh/ssh_host_dsa_key $ROOTFS/etc/ssh/

test -e /etc/ssh/ssh_host_ecdsa_key || \
        ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -P "" \
        cp -p /etc/ssh/ssh_host_ecdsa_key $ROOTFS/etc/ssh/

test -e /etc/ssh/ssh_host_ed25519_key || \
        ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -P "" \
        cp -p /etc/ssh/ssh_host_ed25519_key $ROOTFS/etc/ssh/

