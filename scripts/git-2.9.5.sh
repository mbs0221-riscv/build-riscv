#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=git
export VERSION=2.9.5
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.9.5.tar.xz
export SOURCE=git-2.9.5.tar.xz
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
#echo ac_cv_have_abstract_sockets=yes >> riscv64-unknown-linux.cache
#echo ac_cv_type_long_long=yes >> riscv64-unknown-linux.cache
#echo ac_cv_func_posix_getpwuid_r=yes >> riscv64-unknown-linux.cache
#echo glib_cv_stack_grows=no >> riscv64-unknown-linux.cache
#echo glib_cv_uscore=no >> riscv64-unknown-linux.cache
#
#echo ac_cv_func_posix_getgrgid_r=yes >> riscv64-unknown-linux.cache
#echo ac_cv_func_posix_getpwuid_r=yes >> riscv64-unknown-linux.cache
#echo ac_cv_lib_rt_clock_gettime=no >> riscv64-unknown-linux.cache
#echo glib_cv_monotonic_clock=yes >> riscv64-unknown-linux.cache
echo ac_cv_fread_reads_directories=no >> riscv64-unknown-linux.cache
echo ac_cv_snprintf_returns_bogus=no >> riscv64-unknown-linux.cache
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
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
