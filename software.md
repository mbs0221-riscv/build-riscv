# riscv-software
```
# module-init-tools
sudo apt install docbook-utils docbook-to-man

# vim-64 [XX]
# ./configure --host=riscv64-unknown-linux-gnu --with-features=tiny --disable-gui --without-x --disable-selinux --disable-acl --disable-gpm CPPFLAGS=-I$SYSROOT/usr/include/ncurses LDFLAGS=-L$SYSROOT/usr/lib

# ntp [OK]

# local timezone
cp /usr/share/zoneinfo/Asia/Shanghai $ROOTFS/etc/localtime

# host side
sudo apt –y install ntp
service ntp-systemd-netif start
service ntp-systemd-netif status
```

## nfs-utils
```
wget https://www.kernel.org/pub/linux/utils/nfs-utils/2.5.4/nfs-utils-2.5.4.tar.xz
wget https://cdn.kernel.org/pub/linux/utils/nfs-utils/2.5.4/nfs-utils-2.5.4.tar.xz
tar -xvf nfs-utils-2.5.4.tar.xz
cd nfs-utils-2.5.4/

export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH

make -j8 && make DESTDIR=$SYSROOT/usr install-strip
```

```
wget https://ftp.osuosl.org/pub/blfs/conglomeration/nfs-utils/nfs-utils-2.5.3.tar.xz
tar -xvf nfs-utils-2.5.3.tar.xz 
cd nfs-utils-2.5.3

./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu --sysconfdir=$SYSROOT/etc --sbindir=$SYSROOT/usr/bin --disable-nfsv4 --disable-gss --disable-ipv6 --enable-shared --with-sysroot=$SYSROOT --with-systemd=no --disable-uuid
./configure --prefix=$ROOTFS/usr --host=riscv64-unknown-linux-gnu --sysconfdir=$ROOTFS/etc --sbindir=$ROOTFS/usr/bin --disable-nfsv4 --disable-gss --disable-ipv6 --enable-shared --with-sysroot=$SYSROOT --with-systemd=no --disable-uuid
make -j8 && make install-strip
```
