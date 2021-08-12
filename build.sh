#!/bin/bash

__tarfile_=$(./mkspec.sh $1 $2 | grep __tarfile_: | sed 's/.*: //')
__specfile_=$(./mkspec.sh $1 $2 | grep __specfile_: | sed 's/.*\///')

cat $__specfile_

test -e ~/rpmbuild/SOURCES/$__tarfile_ || wget -P ~/rpmbuild/SOURCES $1

rpmbuild -ba $__specfile_
