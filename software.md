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
