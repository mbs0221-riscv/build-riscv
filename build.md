# riscv-library
## openssl
```
wget https://www.openssl.org/source/openssl-1.1.1k.tar.gz
tar -xvf openssl-1.1.1k.tar.gz
cd openssl-1.1.1k/

./config no-asm --shared --prefix=$SYSROOT/usr CC=riscv64-unknown-linux-gnu-gcc PLATFORM=riscv64gc
./config no-asm --shared --prefix=$ROOTFS/usr CC=riscv64-unknown-linux-gnu-gcc PLATFORM=riscv64gc
sed -i 's/-m64//g' Makefile 
make && make install
```
```
[root@vc709 ]#openssl version -a
OpenSSL 1.1.1k  25 Mar 2021
built on: Fri Jul 23 03:22:49 2021 UTC
platform: linux-x86_64
options:  bn(64,64) rc4(int) des(int) idea(int) blowfish(ptr) 
compiler: riscv64-unknown-linux-gnu-gcc -fPIC -pthread  -Wall -O3 -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_PIC -DNDEBUG
OPENSSLDIR: "/home/ubuntu/riscv-linux/rootfs/usr/ssl"
ENGINESDIR: "/home/ubuntu/riscv-linux/rootfs/usr/lib/engines-1.1"
Seeding source: os-specific
[root@vc709 ]#
```

## pcap
http://www.us.tcpdump.org/release/
```
cd libpcap-1.9.1/
./configure --prefix=$SYSROOT/usr/local --host=riscv64-unknown-linux-gnu --target=riscv64-unknown-linux-gnu --with-pcap=linux 
./configure --prefix=$ROOTFS/usr/local --host=riscv64-unknown-linux-gnu --target=riscv64-unknown-linux-gnu --with-pcap=linux
make && make install
```

## zlib
```
cd zlib-1.2.8/

./configure --prefix=$SYSROOT/usr
sed -i '19,31s/gcc/$(TARGET)gcc/g' Makefile
sed -i '39s/ar/$(TARGET)ar/g' Makefile
sed -i '41s/ranlib/$(TARGET)ranlib/g' Makefile
sed -i '42s/ldconfig/$(TARGET)ldconfig/g' Makefile
sed -i '18a TARGET?=riscv64-unknown-linux-gnu-' Makefile
make && make install

# host
./configure --prefix=build/
make
```

## ncurses
```
cd ncurses-6.2/
./configure --prefix=$SYSROOT/ --host=riscv64-unknown-linux-gnu --without-cxx --without-cxx-binding --without-ada --without-manpages --without-progs --without-tests --with-shared
make && make install
cd $SYSROOT/usr/lib
ln -s libncurses.so.6 libtinfo.so.6
ln -s libtinfo.so.6 libtinfo.so
```

## TinyXML-2
```
git clone https://github.com/leethomason/tinyxml2.git
cd tinyxml2
mkdir build && cd build
CC=riscv64-unknown-linux-gnu-gcc CXX=riscv64-unknown-linux-gnu-g++ cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr/local ../
CC=riscv64-unknown-linux-gnu-gcc CXX=riscv64-unknown-linux-gnu-g++ cmake -DCMAKE_INSTALL_PREFIX=$ROOTFS/usr/local ../
make && make install
```

## mbedtls
```
wgetnc https://github.com/ARMmbed/mbedtls/archive/refs/tags/v3.0.0.tar.gz
tar -xvf v3.0.0.tar.gz
cd mbedtls-3.0.0/
CC=riscv64-unknown-linux-gnu-gcc cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr/local -DUSE_SHARED_MBEDTLS_LIBRARY=On ../
make && make install
```

## linux-pam
```
git clone https://github.com/linux-pam/linux-pam.git
cd linux-pam/
git checkout v1.5.1
```

## libtirpc-1.3.2
https://www.linuxfromscratch.org/blfs/view/svn/basicnet/libtirpc.html
```
ubuntu@optiplex-5060:~/riscv-linux/library/libtirpc-1.3.2$ ./configure --prefix=$ROOTFS/usr --host=riscv64-unknown-linux-gnu --sysconfdir=$ROOTFS/etc --disable-gssapi --enable-shared 
make -j12 && make install
----------------------------------------------------------------------
Libraries have been installed in:
   /home/ubuntu/riscv-linux/rootfs/usr/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the '-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the 'LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the 'LD_RUN_PATH' environment variable
     during linking
   - use the '-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to '/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
```

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

## bash

```
wget --no-check-certificate https://ftp.gnu.org/gnu/bash/bash-5.1.8.tar.gz
tar -xvf bash-5.1.8.tar.gz

cd bash-5.1.8/
./configure --prefix=$ROOTFS/ --target=riscv64-unknown-linux-gnu --host=riscv64-unknown-linux-gnu --build=x86_64-linux-gnu CC=riscv64-unknown-linux-gnu-gcc AR=riscv64-unknown-linux-gnu-ar RANLIB=riscv64-unknown-linux-gnu-ranlib STRIP=riscv64-unknown-linux-gnu-strip
make -j12 strip
make install
```

## lrzsz
```
cd lrzsz-0.12.20/
CC=riscv64-unknown-linux-gnu-gcc
./configure --cache-file=./riscv-linux.cache --prefix=$ROOTFS/usr/local
make -j12
ls -lh
riscv64-unknown-linux-gnu-strip lr* ls*
ls -lh
make install
```

## ppp
```
wget --no-check-certificate https://download.samba.org/pub/ppp/ppp-2.4.9.tar.gz
tar -xvf ppp-2.4.9.tar.gz

cd ppp-2.4.9/
./configure --prefix=$ROOTFS/usr/local --sysconfdir=$ROOTFS/etc --cc=riscv64-unknown-linux-gnu-gcc --cross-compile=riscv64-unknown-linux-gnu  --sysconf=$ROOTFS/etc
CC=riscv64-unknown-linux-gnu-gcc AR=riscv64-unknown-linux-gnu-ar STRIP=riscv64-unknown-linux-gnu-strip make -j12
CC=riscv64-unknown-linux-gnu-gcc AR=riscv64-unknown-linux-gnu-ar STRIP=riscv64-unknown-linux-gnu-strip make
make install

# host
./configure
make && make install

# route
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o eno0 -j MASQUERADE
```
## dropbear
```
cd dropbear-2020.81/
./configure --prefix=$ROOTFS/usr/local --host=riscv64-unknown-linux --with-zlib=$SYSROOT/usr CC=riscv64-unknown-linux-gnu-gcc AR=riscv64-unknown-linux-gnu-ar RANLIB=riscv64-unknown-linux-gnu-ranlib STRIP=riscv64-unknown-linux-gnu-strip
make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" strip
make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" install

# host
./configure --prefix=/usr --with-zlib=/home/ubuntu/riscv-linux/library/zlib-1.2.8/build
sudo make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" install
```

# vsftpd
```
wget --no-check-certificate https://security.appspot.com/downloads/vsftpd-3.0.4.tar.gz
tar -xvf vsftpd-3.0.4.tar.gz
cd vsftpd-3.0.4

make && make install
cp vsftpd.conf $ROOTFS/etc
cp vsftpd $ROOTFS/usr/local/sbin/vsftpd
cp vsftpd.conf.5 $ROOTFS/usr/local/man/man5
cp vsftpd.8 $ROOTFS/usr/local/man/man8
```
## openssh
```
wget --no-check-certificate https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.6p1.tar.gz
tar -xvf openssh-8.6p1.tar.gz
cd openssh-8.6p1

./configure --prefix=$ROOTFS/usr/local --host=riscv64-unknown-linux-gnu --with-libs --with-zlib=$SYSROOT/usr --with-ssl-dir=$SYSROOT/usr --with-privsep-path=/var/empty --with-privsep-user=sshd --with-ssl-engine --with-md5-passwords --disable-etc-default-login 

OpenSSH has been configured with the following options:
                     User binaries: /home/ubuntu/riscv-linux/rootfs/usr/local/bin
                   System binaries: /home/ubuntu/riscv-linux/rootfs/usr/local/sbin
               Configuration files: /home/ubuntu/riscv-linux/rootfs/usr/local/etc
                   Askpass program: /home/ubuntu/riscv-linux/rootfs/usr/local/libexec/ssh-askpass
                      Manual pages: /home/ubuntu/riscv-linux/rootfs/usr/local/share/man/manX
                          PID file: /var/run
  Privilege separation chroot path: /var/empty
            sshd default user PATH: /usr/bin:/bin:/usr/sbin:/sbin:/home/ubuntu/riscv-linux/rootfs/usr/local/bin
                    Manpage format: doc
                       PAM support: no
                   OSF SIA support: no
                 KerberosV support: no
                   SELinux support: no
              MD5 password support: yes
                   libedit support: no
                   libldns support: no
  Solaris process contract support: no
           Solaris project support: no
         Solaris privilege support: no
       IP address in $DISPLAY hack: no
           Translate v4 in v6 hack: yes
                  BSD Auth support: no
              Random number source: OpenSSL internal ONLY
             Privsep sandbox style: seccomp_filter
                   PKCS#11 support: yes
                  U2F/FIDO support: yes
                  
CC=riscv64-unknown-linux-gnu-gcc AR=riscv64-unknown-linux-gnu-ar STRIP=riscv64-unknown-linux-gnu-strip make clean && make -j12 && make install 
ls -lh scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan sshd sftp-server ssh-keysign
riscv64-unknown-linux-gnu-strip scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan sshd sftp-server ssh-keysign
ls -lh scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan sshd sftp-server ssh-keysign
cp scp sftp ssh ssh-add ssh-agent ssh-keygen ssh-keyscan $ROOTFS/usr/local/bin
cp sshd $ROOTFS/usr/local/sbin
cp sftp-server  ssh-keysign $ROOTFS/usr/local/libexec
cp moduli ssh_config sshd_config $ROOTFS/usr/local/etc

vim etc/sshd_config
PermitRootLogin yes
```
## samba-4.14.6
```
cd samba-4.14.6
```
## sqlite3
```
cd sqlite-autoconf-3360000/
./configure --host=riscv64-unknown-linux-gnu --prefix=$SYSROOT/opt/sqlite3
make -j12 && make install

----------------------------------------------------------------------
Libraries have been installed in:
   /home/ubuntu/chipyard/riscv-tools-install/sysroot/opt/sqlite3/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the '-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the 'LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the 'LD_RUN_PATH' environment variable
     during linking
   - use the '-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to '/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------
```
