#!/bin/bash

export SPECS=~/rpmbuild/SPECS
export SOURCES=~/rpmbuild/SOURCES

source build-utils.sh

# make spec file
cd $SPECS
make_spec $1 $2
cat $SPECFILE

# prepare
cd $SOURCES
test -e $SOURCE || wget $URL

# build rpm package
cd $SPECS
rpmbuild -ba $SPECFILE
