#!/bin/bash

function parse_url(){

        export __url_=$1
	export __prefix_=${2:-/usr/local}
        export __tarfile_=$(echo $__url_ | sed 's/.*\///')
	export __filename_=$(echo $__tarfile_ | sed 's/.*\///;s/.tar//;s/.src//;s/.gz\|.sz\|.lz\|.xz\|.bz2\|.tgz//')
        export __package_=$(echo $__filename_ | sed 's/-.*//')
	export __version_=$(echo $__filename_ | sed 's/.*-//')
	export __specfile_=~/rpmbuild/SPECS/$__filename_.spec

        echo ===============================BUILD PACKAGE========================================
        echo __url_: $__url_
	echo __prefix: $__prefix_
        echo __tarfile_: $__tarfile_
        echo __filename_: $__filename_
        echo __package_: $__package_
        echo __version_: $__version_
	echo __specfile_: $__specfile_

	cp ~/rpmbuild/SPECS/template.spec ~/rpmbuild/SPECS/$__filename_.spec
	sed -i "s#\$prefix#$__prefix_#" ~/rpmbuild/SPECS/$__filename_.spec
	sed -i "s#\$name#$__package_#" ~/rpmbuild/SPECS/$__filename_.spec
	sed -i "s#\$version#$__version_#" ~/rpmbuild/SPECS/$__filename_.spec
	sed -i "s#\$url#$__url_#" ~/rpmbuild/SPECS/$__filename_.spec
	sed -i "s#\$source#$__tarfile_#" ~/rpmbuild/SPECS/$__filename_.spec
	sed -i "s#-j8#-j\$(nproc)#" ~/rpmbuild/SPECS/$__filename_.spec

	cat ~/rpmbuild/SPECS/$__filename_.spec
}

parse_url $1 $2
