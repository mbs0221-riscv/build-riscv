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

# generate header
sed -i "1i \#!/bin/bash" $target
sed -i "2i \# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY" $target
sed -i "3i cd ~/rpmbuild/SOURCES" $target
sed -i "s/Name:           /export NAME=/" $target
sed -i "s/Version:        /export VERSION=/" $target
sed -i "s/Source0:        /export SOURCE=/" $target
sed -i "s/URL:            /export URL=/" $target

# extracting files and entering builddir
sed -i "/%setup/i test -e \$SOURCE || wget \$URL && tar -xvf \$SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD" $target
sed -i "/%setup/a cd \$__build_dir_" $target
sed -i "s/%setup -n/export __build_dir_=&/" $target
sed -i "s/%setup/export __build_dir_=\$NAME-\$VERSION/" $target

# SYSROOT
sed -i "s/%{?buildroot}/\$SYSROOT/" $target     # %{?buildroot}

# DO NOT REMOVE SYSROOT
sed -i "s/rm .*//" $target                      # rm .*

# BACK TO __build_dir_
sed -i "s/%build/cd \$__build_dir_/" $target    # %build
sed -i "s/%install/cd \$__build_dir_/" $target  # %install

# EPILOG
echo "
        test \$? -eq 0 || exit 0
        cd ~/rpmbuild/BUILD
        cd \$__build_dir_
        rm -rf \$__build_dir_
        echo pass: \$NAME-\$VERSION
" >> $target

# REMOVE EXTRES
sed -i "s/.*: .*//" $target                     #  .*: .*         remove package info
sed -i "s/^\/.*//" $target                      # ^\/.*           remove path
sed -i "s/^%.*//" $target                       # ^%.*            remove spec % command
sed -i "s/.*\!$//" $target                      # .*\!$           remove description
sed -i "s/^[ \t]*//g" $target                   # ^[ \t]*         strip head
sed -i "s/[ \t]*$//g" $target                   # [ \t]*$         strip tail
sed -i "/^$/d" $target                          # ^$              remove empty lines

chmod +x $target
