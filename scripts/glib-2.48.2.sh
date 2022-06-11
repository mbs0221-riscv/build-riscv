#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=glib
export VERSION=2.48.2
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://ftp.gnome.org/pub/gnome/sources/glib/2.48/glib-2.48.2.tar.xz
export SOURCE=glib-2.48.2.tar.xz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
post
# pre
prep
# setup
setup
echo glib_cv_long_long_format=ll >> riscv64-unknown-linux.cache
echo glib_cv_stack_grows=no >> riscv64-unknown-linux.cache
echo glib_cv_have_strlcpy=no >> riscv64-unknown-linux.cache
echo glib_cv_have_qsort_r=yes >> riscv64-unknown-linux.cache
echo glib_cv_va_val_copy=yes >> riscv64-unknown-linux.cache
echo glib_cv_uscore=no >> riscv64-unknown-linux.cache
echo glib_cv_rtldglobal_broken=no >> riscv64-unknown-linux.cache
echo ac_cv_func_posix_getpwuid_r=yes >> riscv64-unknown-linux.cache
echo ac_cv_func_posix_getgrgid_r=yes >> riscv64-unknown-linux.cache
export CFLAGS="-Wformat-overflow"
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --enable-iconv=no \
            --with-libiconv=gnu \
            --with-pcre=system \
            --disable-libelf \
            --cache-file=riscv64-unknown-linux.cache
# build
build
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
