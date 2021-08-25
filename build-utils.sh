#!/bin/bash

export SPECS=~/rpmbuild/SPECS
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD

function make_spec(){

        export SOURCE=$(echo $URL | sed 's/.*\///')
        export NAME_VERSION=$(echo $SOURCE | sed 's/.tar//;s/.src//;s/.gz\|.sz\|.lz\|.xz\|.bz2\|.tgz\|.zip//')
        export NAME=$(echo $NAME_VERSION | sed 's/-[0-9].*//')
        export VERSION=$(echo $NAME_VERSION | sed 's/.*-//')
        export SPECFILE=$NAME_VERSION.spec

        echo ===============================BUILD PACKAGE========================================
	echo TEMPLATE: $TEMPLATE
        echo URL:      $URL
        echo PREFIX:   $PREFIX
        echo SOURCE:   $SOURCE
        echo NAME:     $NAME
        echo VERSION:  $VERSION
        echo SPECFILE: $SPECFILE

	cd $SPECS
        test -e $SPECFILE || echo create new spec file && \
                cp $TEMPLATE $SPECFILE && \
                sed -i "s#\$prefix#$PREFIX#"   $SPECFILE && \
                sed -i "s#\$name#$NAME#"       $SPECFILE && \
                sed -i "s#\$version#$VERSION#" $SPECFILE && \
                sed -i "s#\$url#$URL#"         $SPECFILE && \
                sed -i "s#\$source#$SOURCE#"   $SPECFILE && \
                sed -i "s#-j8#-j\$(nproc)#"    $SPECFILE

        cat $SPECFILE
}

function prep(){

	cd $SOURCES
}

function setup(){

	if [ "$1" = "-n" ]; then
		export __build_dir_=$BUILD/$2
	else
		export __build_dir_=$BUILD/$NAME-$VERSION
	fi

	rm -rf $__build_dir_

	cd $SOURCES

	test -e $SOURCE || wget --no-check-certificate $URL
        tar -xvf $SOURCE -C $BUILD

	cd $__build_dir_
}

function pre(){
	cd $SOURCES
}

function post(){
	cd $SOURCES
}

function prep(){
	cd $SOURCES
}

function build(){

	cd $__build_dir_
}

function build_rpm(){
	cd $SPECS
        rpmbuild -ba $SPECFILE
}

function install(){

	cd $__build_dir_
}

function clean(){

	cd $__build_dir_
}

function epilog(){

        test $? -eq 0
}
