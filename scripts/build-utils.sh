#!/bin/bash

function parse_url(){

        export url=$1
        export filename=$(echo $url | sed 's/.*\///')
        export package=$(echo $filename | sed 's/-.*//')
        export dir=$(echo $filename | sed 's/.tar//;s/.gz//;s/.xz//;s/.bz2//')

        echo ===============================BUILD PACKAGE========================================
        echo url: $url
        echo filename: $filename
        echo package: $package
        echo dir: $dir

        cd ~/rpmbuild/SOURCES

        test -e $filename || wget $url
        test -d $dir || tar -xvf $filename && cd $dir

        echo entering $dir :
}

function install_patch(){

        export url=$1
        export filename=$(echo $url | sed 's/.*\///')
        export package=$(echo $filename | sed 's/-.*//')

        echo package $package
        echo install patch: $filename

        test -e $filename || wget $url

        patch -Np1 -i $filename
}

function make_install(){
        make -j$(nproc) && make install
}

function ninja_install(){
        ninja -j $(nproc) && ninja install
}

function epilog(){
        test $? -eq 0 || exit 0
        cd ~/rpmbuild/SOURCES
#       rm -rf $dir
        echo pass: $filename
}
