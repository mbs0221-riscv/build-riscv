#!/bin/bash

$INSTALL_DIR=~/D/Ubuntu/synopsys
$SYNOPSYS=/usr/synopsys

# 1 链接安装文件夹
cd $SYNOPSYS
ln -s $INSTALL_DIR/vcs_2016.06 vcs_2016.06
ln -s $INSTALL_DIR/scl_11.9 scl_11.9
ln -s $INSTALL_DIR/verdi_2016.06-1 verdi_2016.06-1

# 2. 复制license
cd ~
cp Synopsys.dat $SYNOPSYS/vcs_2016.06/license/
cp Synopsys.dat $SYNOPSYS/verdi_2016.06-1/license/
source ~/.bashrc

# 1. 为了启动lmg_vcs安装lsb
apt-get install lsb-core

# 2. 开放端口
ufw allow 27000
ufw enable
ufw reload
ufw status

# 3. 修改ubuntu 上的/bin/sh
rm -f /bin/sh
ln -s /bin/bash /bin/sh

# 4. 安装libjpeg.so.62
apt-get install libjpeg62-dev

# 5. 为lmgrd创建文件夹，该命令本身不能再root权限下运行，因此自身无法创建
mkdir /usr/tmp
