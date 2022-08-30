# riscv-library
## linux-pam
```
git clone https://github.com/linux-pam/linux-pam.git
cd linux-pam/
git checkout v1.5.1
```
# riscv-software
## vim-64 [X]
```
cd vim81/
./configure --host=riscv64-unknown-linux-gnu --with-features=tiny --disable-gui --without-x --disable-selinux --disable-acl --disable-gpm CPPFLAGS=-I$SYSROOT/usr/include/ncurses LDFLAGS=-L$SYSROOT/usr/lib
```
## guile
```
sudo apt install guile-3.0 guile-3.0-dev guile-3.0-doc guile-3.0-libs
```
## glib
```
cd ~/.local/share/meson/cross
```

## build library and software
build rpm packages
* Install and configure rpmbuild
  ```
  sudo apt install -y rpm
  ```
* Modify `~/.rpmmacros`
  ```
  %_topdir    $HOME/rpmbuild
  ```
* Make directories
  ```
  mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
  ```
* Download tars
  ```
  wget -N -i packages.txt -P ~/rpmbuild/SOURCES/
  ```
* Build rpm packages
  ```
  ls ~/rpmbuild/RPMS/x86_64 | grep rpm | sed 's/-1.x86_64.rpm/.spec/;s/^/rpmbuild -ba /' > build-rpm.sh
  chmod +x build-rpm.sh
  cp -p build-rpm.sh ~/rpmbuild/SPECS
  cd ~/rpmbuild/SPECS
  ./build-rpm.sh
  ```
* Find failed to built rpm packages
  ```
  ./summary
  ```
* Convert rpm spec files into shell scripts
  ```
  ls ~/rpmbuild/SPECS/*.spec | xargs -i ./convert.sh {}
  ```

build examples
```
# build libpcap/tcpdump from source
./build.sh https://www.tcpdump.org/release/libpcap-1.10.1.tar.gz
./build.sh https://www.tcpdump.org/release/tcpdump-4.99.1.tar.gz
```

build library
```
# systemd
apt install intltool xmlto

# nfs-utils
./run-spec.sh libtirpc-1.3.2.spec
./run-spec.sh rpcbind-1.2.6.spec

# python 3.9
sudo apt install python3.9
./run-spec.sh Python-3.9.6.spec
./run-spec.sh libxml2-2.9.12.spec

# guile/
## bdw-gc for libunistring
cd gc-8.0.4
./configure --prefix=/usr
make -j$(nproc) && sudo make install

## libunistring for guile
sudo apt install libunistring-dev

## guile
cd guile-3.0.7
./configure --prefix=/usr
make -j12 && sudo make install

# gmp/mpfr/mpc
./run-spec.sh gmp-6.1.2.spec
./run-spec.sh mpfr-4.0.1.spec
./run-spec.sh mpc-1.1.0.spec

# readline/pcre2/libbytesize
./run-spec.sh readline-8.1.spec
./run-spec.sh pcre2-10.37.spec
./run-spec.sh libbytesize-2.6.spec

# GNU TLS
./run-spec.sh nettle-3.7.spec 
./run-spec.sh guile-3.0.7.spec
./run-spec.sh gnutls-3.1.5.spec

# The `libgpg-error-1.42` should be built before cross-compiling `scute`.
cd libgpg-error-1.42
./configure --prefix=/usr

make -j$(nproc) && sudo make install
```
Comment following line in `/etc/ImageMagick-6/policy.xml` to solve the security issue in building `scute`.
```
<policy domain="coder" rights="none" pattern="EPS" />
```