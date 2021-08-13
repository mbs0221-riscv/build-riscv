#!/bin/bash
# Convert RPM SPEC FILES INTO SHELL BUILD SCRIPTS
# Usage:
#         ls ~/rpmbuild/SPECS/*.spec | xargs -i ./convert.sh {}

# prefix
prefix=/nfsroot/build-riscv/scripts
test -d $prefix || mkdir -p $prefix

# source -> destination
rpm_spec_file=$1
shell_file=$(basename $rpm_spec_file | sed "s/spec/sh/")

test -d $prefix || mkdir -p $prefix

target=$prefix/$shell_file
touch $target
echo generate build-script in $target
cat $1 > $target

# HEADER
sed -i "1i \#!/bin/bash" $target
sed -i "2i \# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY" $target
sed -i "3i export SOURCES=~/rpmbuild/SOURCES" $target
sed -i "4i export BUILD=~/rpmbuild/BUILD" $target
sed -i "s/Name:           /export NAME=/" $target
sed -i "s/Version:        /export VERSION=/" $target
sed -i "s/Source0:        /export SOURCE=/" $target
sed -i "s/URL:            /export URL=/" $target

# DOWNLOAD AND EXTRACT
sed -i "/%setup/a cd \$__build_dir_" $target                                                 
sed -i "/%setup -n/i %setup/" $target                                                        
sed -i "s/%setup -n[ \t]*/export __build_dir_=\$BUILD\//" $target                            
sed -i "/%setup/i export __build_dir_=\$BUILD\/\$NAME-\$VERSION" $target                     
sed -i "/%setup/i cd \$SOURCES" $target                                                      
sed -i "/%setup/a test -e \$SOURCE || wget \$URL && tar -xvf \$SOURCE -C \$BUILD" $target

# CONFIGURE
sed -i "s/%{?buildroot}/\$SYSROOT/g" $target       # %{?buildroot}

# BUILD AND INSTALL
sed -i "/%build/a cd \$__build_dir_" $target 
sed -i "/%install/a cd \$__build_dir_" $target 

# MAKEFLAGS
sed -i "s/-j8/-j\$(nproc)/" $target 

# EPILOG
echo "
test \$? -eq 0 || exit 0
cd \$__build_dir_
echo pass: \$NAME-\$VERSION
" >> $target

# REMOVE EXTRES
sed -i "s/.*: .*//g" $target                        #  .*: .*         remove package info
sed -i "s/^\/.*//g" $target                         # ^\/.*           remove path
sed -i "s/%/#/g" $target                            # %               remove spec % command
sed -i "s/.*\!$//g" $target                         # .*\!$           remove description
sed -i "s/[ \t]*$//g" $target                       # [ \t]*$         strip tail
sed -i "/^$/d" $target                              # ^$              remove empty lines
sed -i "s/rm .*//g" $target                         # rm .*           do not remove build target

chmod +x $target
