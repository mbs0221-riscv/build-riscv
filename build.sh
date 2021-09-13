#!/bin/bash

export SPECS=~/rpmbuild/SPECS
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD

source build-utils.sh

export URL=$1
export PREFIX=${2:-/usr}
export TEMPLATE=${3:-make-template.spec}

make_spec 
setup
build_rpm
