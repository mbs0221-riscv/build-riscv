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

# HEADER
echo "#!/bin/bash" > $target
echo "source ../build-utils.sh" >> $target
cat $1 >> $target

# ENVIRONMENT VARIEBLES
sed -i "s/Name:           /export NAME=/" $target
sed -i "s/Version:        /export VERSION=/" $target
sed -i "s/Source0:        /export SOURCE=/" $target
sed -i "s/URL:            /export URL=/" $target

# CONFIGURE
sed -i "s/%{?buildroot}/\$SYSROOT/g" $target
sed -i "s/%{?_sourcedir}/\$SOURCES/g" $target

# SPEC COMMAND
sed -i "s/%pre/# pre\npre/" $target
sed -i "s/%post/# pre\npost/" $target
sed -i "s/%prep/# prep\nprep/" $target
sed -i "s/%setup/# setup\nsetup/" $target
sed -i "s/%build/# build\nbuild/" $target
sed -i "s/%install/# install\ninstall/" $target
sed -i "s/%clean/# clean\nclean/" $target

# MAKEFLAGS
sed -i "s/-j8/-j\$(nproc)/" $target 

# EPILOG
echo epilog >> $target

# REMOVE EXTRES
sed -i "s/.*: .*\|.*\.$/# &/g" $target              # comment header
sed -i "s/^%.*$/# &/g" $target                      # comment command
sed -i "s/.*\!$/# &/g" $target                      # comment sentences
sed -i "s/^\/.*/# path: &/g" $target                # comment path
sed -i "s/[ \t]*$//g" $target                       # strip tail
sed -i "/^$/d" $target                              # remove empty lines
sed -i "s/rm .*//g" $target                         # do not remove build target

chmod +x $target
