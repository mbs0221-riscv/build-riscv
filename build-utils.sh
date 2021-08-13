#!/bin/bash

function parse_url(){

        export __url_=$1
        export __filename_=$(echo $__url_ | sed 's/.*\///')
        export __package_=$(echo $__filename_ | sed 's/-.*//')
        export __build_dir_=$(echo $__filename_ | sed 's/.*\///;s/.tar//;s/.gz\|.sz\|.lz\|.xz\|.bz2//')

        echo ===============================BUILD PACKAGE========================================
        echo __url_: $__url_
        echo __filename_: $__filename_
        echo __package_: $__package_
        echo __build_dir_: $__build_dir_

        cd ~/rpmbuild/SOURCES

        test -e $__filename_ || wget $__url_
}

function install_patch(){

        export __url_=$1
        export __filename_=$(echo $__url_ | sed 's/.*\///')
        export __package_=$(echo $__filename_ | sed 's/-.*//')

        echo __package_ $__package_
        echo install patch: $__filename_

        test -e $__filename_ || wget $__url_

        patch -Np1 -i $__filename_
}

function make_install(){
        make -j$(nproc) && make install
}

function ninja_install(){
        ninja -j$(nproc) && ninja install
}

function epilog(){

        test $? -eq 0 || exit 0

        cd ~/rpmbuild/SOURCES
  	rm -rf $__build_dir_
        echo pass: $__filename_
}
