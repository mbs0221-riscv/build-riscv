#!/bin/bash
# Usage:
#         ls ~/rpmbuild/SPECS/*.spec | xargs -i ./convert.sh {}

# prefix
prefix=/nfsroot/build-riscv/scripts

# source -> destination
rpm_spec_file=$1
shell_file=$(basename $rpm_spec_file | sed "s/spec/sh/")

test -d $prefix || mkdir -p $prefix

target=$prefix/$shell_file

touch $target
echo generate build-script in $target
echo "#!/bin/bash" > $target
echo "# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh
" >> $target

# pattern: URL: | .*: .* | %{?buildroot} | rm.* | ^\/.* | ^%.* | .*\!
cat $1 | sed "s/URL:/parse_url/;s/.*: .*//;s/%{?buildroot}/\$SYSROOT/;s/rm.*//;s/^\/.*//;s/^%.*//;s/.*\!//" | grep -v "^$" >> $target
echo "
epilog
" >> $target

chmod +x $target
