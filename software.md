# riscv-software
## module-init-tools
```
cd module-init-tools-3.15/
./configure --host=riscv64-unknown-linux-gnu CC=riscv64-unknown-linux-gnu-gcc --enable-zlib --prefix=$ROOTFS
sudo apt install docbook-utils
sudo apt install docbook-to-man
make CFLAGS=-I$LIBRARY/zlib-1.2.8/build/include/ LDFLAGS=-L$LIBRARY/zlib-1.2.8/build/lib/
make install
```

## vim-64 [XX]
```
cd vim81/
./configure --host=riscv64-unknown-linux-gnu --with-features=tiny --disable-gui --without-x --disable-selinux --disable-acl --disable-gpm CPPFLAGS=-I$SYSROOT/usr/include/ncurses LDFLAGS=-L$SYSROOT/usr/lib
```

## samba-4.14.6
```
cd samba-4.14.6
```

## npt-4.2.8p15
```
wget http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p15.tar.gz
tar -xvf ntp-4.2.8p15.tar.gz
cd ntp-4.2.8p15/

#./configure --prefix=$ROOTFS --enable-ipv6 --enable-nist --enable-shared --enable-all-clocks --host=riscv64-unknown-linux-gnu
./configure --prefix=$ROOTFS/usr/local --exec-prefix=$ROOTFS/usr/local --enable-shared --host=riscv64-unknown-linux-gnu --with-yielding-select=yes

# local timezone
cp /usr/share/zoneinfo/Asia/Shanghai $ROOTFS/etc/localtime

# host side
sudo apt –y install ntp
service ntp-systemd-netif start
service ntp-systemd-netif status
```

## htop
```
wget http://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz
tar -xvf htop-2.2.0.tar.gz
cd htop-2.2.0/

./configure --prefix=$ROOTFS/usr --disable-unicode --host=riscv64-unknown-linux-gnu CPPFLAGS=-I/home/kiki212/chipyard/riscv-tools-install/sysroot/include LDFLAGS=-L/home/kiki212/chipyard/riscv-tools-install/sysroot/lib
make -j8 && make install
```

```
## nfs-utils
```
wget https://www.kernel.org/pub/linux/utils/nfs-utils/2.5.4/nfs-utils-2.5.4.tar.xz
tar -xvf nfs-utils-2.5.4.tar.xz
cd nfs-utils-2.5.4/

export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH

./configure --prefix=$ROOTFS/usr --host=riscv64-unknown-linux-gnu --sysconfdir=$ROOTFS/etc --sbindir=$ROOTFS/usr/bin --disable-nfsv4 --disable-gss --disable-ipv6  --enable-shared --with-sysroot=$SYSROOT --with-systemd=no --disable-uuid

make -j12 && make DESTDIR=$SYSROOT/usr install-strip
```
