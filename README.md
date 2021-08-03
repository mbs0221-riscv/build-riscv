# Connect the Rocketchip to the Network Using UART
## Step 1: pppd
```
wget --no-check-certificate https://download.samba.org/pub/ppp/ppp-2.4.9.tar.gz
tar -xvf ppp-2.4.9.tar.gz
cd ppp-2.4.9/

# board side
./configure --prefix=$ROOTFS/usr/local --sysconfdir=$ROOTFS/etc --cc=riscv64-unknown-linux-gnu-gcc --cross-compile=riscv64-unknown-linux-gnu  --sysconf=$ROOTFS/etc
CC=riscv64-unknown-linux-gnu-gcc AR=riscv64-unknown-linux-gnu-ar STRIP=riscv64-unknown-linux-gnu-strip make -j12
make install

# host side
./configure
make -j12 && make install

# route
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o eno0 -j MASQUERADE
```

## Step 2: dropbear
### Step 2.1: zlib
```
wget --no-check-certificate http://www.zlib.net/zlib-1.2.11.tar.gz
cd zlib-1.2.11/

# board side
./configure --prefix=$SYSROOT/usr
sed -i '19,31s/gcc/$(TARGET)gcc/g' Makefile
sed -i '39s/ar/$(TARGET)ar/g' Makefile
sed -i '41s/ranlib/$(TARGET)ranlib/g' Makefile
sed -i '42s/ldconfig/$(TARGET)ldconfig/g' Makefile
sed -i '18a TARGET?=riscv64-unknown-linux-gnu-' Makefile
make && make install

# host side
./configure --prefix=build/
make
```

### Step 2.2: dropbear
```
cd dropbear-2020.81/

# board side
./configure --prefix=$ROOTFS/usr/local --host=riscv64-unknown-linux --with-zlib=$SYSROOT/usr CC=riscv64-unknown-linux-gnu-gcc AR=riscv64-unknown-linux-gnu-ar RANLIB=riscv64-unknown-linux-gnu-ranlib STRIP=riscv64-unknown-linux-gnu-strip
make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" strip
make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" install

# host side
./configure --prefix=/usr --with-zlib=/home/ubuntu/riscv-linux/software/zlib-1.2.8/build
./configure --prefix=/usr --with-zlib=/home/kiki212/software/zlib-1.2.11/build
sudo make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" install
```

## Step 3: openssh
### Step 3.1: openssl
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
### Step 3.2: openssh
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

## Step 3: bash
```
wget --no-check-certificate https://ftp.gnu.org/gnu/bash/bash-5.1.8.tar.gz
tar -xvf bash-5.1.8.tar.gz
cd bash-5.1.8/

# board side
./configure --prefix=$ROOTFS/ --target=riscv64-unknown-linux-gnu --host=riscv64-unknown-linux-gnu --build=x86_64-linux-gnu
CC=riscv64-unknown-linux-gnu-gcc AR=riscv64-unknown-linux-gnu-ar RANLIB=riscv64-unknown-linux-gnu-ranlib STRIP=riscv64-unknown-linux-gnu-strip make -j12 strip
make install
```

## Step 4: vsftpd
```
wget --no-check-certificate https://security.appspot.com/downloads/vsftpd-3.0.4.tar.gz
tar -xvf vsftpd-3.0.4.tar.gz
cd vsftpd-3.0.4

# board side
make && make install
cp vsftpd.conf $ROOTFS/etc
cp vsftpd $ROOTFS/usr/local/sbin/vsftpd
cp vsftpd.conf.5 $ROOTFS/usr/local/man/man5
cp vsftpd.8 $ROOTFS/usr/local/man/man8
```

## Step 5: lrzsz
```
cd lrzsz-0.12.20/

./configure --cache-file=./riscv-linux.cache --prefix=$ROOTFS/usr/local
CC=riscv64-unknown-linux-gnu-gcc make -j12
riscv64-unknown-linux-gnu-strip lr* ls*
make install
```

## Reference
* [Connecting to your Raspberry Pi Console via the Serial Cable](https://medium.com/@sarala.saraswati/connecting-to-your-raspberry-pi-console-via-the-serial-cable-44d7df95f03e)
* [Connect the Raspberry Pi to Network Using UART](https://www.instructables.com/Connect-the-Raspberry-Pi-to-network-using-UART/)
* [Establish PPP Network Connection on Raspberry Pi via Serial Console](https://docs.j7k6.org/raspberry-pi-ppp-network-serial-console/)



