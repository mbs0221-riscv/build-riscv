#!/bin/bash

git config --global https.proxy http://127.0.0.1:8889
git config --global https.proxy https://127.0.0.1:8889

#git config --global --unset http.proxy
#git config --global --unset https.proxy

sudo apt -y install build-essential nghttp2 libnghttp2-dev libssl-dev

# python 3.6
sudo add-apt-repository ppa:deadsnakes/ppa
sudo add-apt-repository ppa:jonathonf/python-3.6

cd ~/chipyard
./scripts/ubuntu-req.sh
./scripts/init-submodules-no-riscv-tools.sh
./scripts/build-toolchains.sh riscv-tools # for a normal risc-v toolchain
source ./env.sh
