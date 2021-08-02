#!/bin/sh

# ====================================================
# Network File System

NFS_ROOT=/mnt/nfs/root
NFS_HOME=/mnt/nfs/home

export NFS_HOME NFS_ROOT

test -d $NFS_HOME || mkdir -p $NFS_HOME
test -d $NFS_ROOT || mkdir -p $NFS_ROOT

echo TIME: $(date "+%Y/%m/%d %H:%M:%S")
time cp $NFS_ROOT/mibench.tar.gz /nfsroot
echo TIME: $(date "+%Y/%m/%d %H:%M:%S")

# ====================================================
# Benchmark

target=ubuntu@10.0.0.2:/home/ubuntu/
scp $BENCHMARK/riscv-coremark/coremark.riscv $target
scp $BENCHMARK/mibench/mibench.tar.gz $target

