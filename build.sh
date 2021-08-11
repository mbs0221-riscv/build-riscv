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

function make_install(){
	make -j$(nproc) && make install
}

function epilog(){
	test $? -eq 0 || exit 0
	cd ~/rpmbuild/SOURCES
	rm -rf $dir
	echo pass: $filename
}

# [PASS]
parse_url https://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz
if [ ! -f $SYSROOT/usr/lib/pkgconfig/readline.pc ]; then
	./configure --prefix=$SYSROOT/usr \
		    --host=riscv64-unknown-linux-gnu &&
	make_install && epilog
fi

# https://www.linuxfromscratch.org/blfs/view/svn/general/pcre2.html
# [PASS]
parse_url https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2
if [ ! -f $SYSROOT/usr/lib/libbytesize.la ]; then
	./configure --prefix=$SYSROOT/usr               \
                    --host=riscv64-unknown-linux-gnu    \
		    --docdir=$SYSROOT/usr/share/doc/pcre2-10.37 \
		    --enable-unicode                    \
		    --enable-pcre2-16                   \
		    --enable-pcre2-32                   \
		    --enable-pcre2grep-libz             \
		    --enable-pcre2test-libreadline      \
		    --disable-static                    &&
	make_install && epilog
fi

# https://www.linuxfromscratch.org/blfs/view/svn/general/libbytesize.html
# [PASS]
# Required: pcre2-10.37
parse_url https://github.com/storaged-project/libbytesize/releases/download/2.6/libbytesize-2.6.tar.gz
if [ ! -f $SYSROOT/usr/lib/libbytesize.la ]; then
	./configure --prefix=$SYSROOT/usr \
		    --host=riscv64-unknown-linux-gnu &&
        make_install && epilog
fi

parse_url https://download.gnome.org/sources/glib/2.68/glib-2.68.3.tar.xz
if [ ! -f $SYSROOT/usr/local/lib/libgsf.la ]; then
	test -e glib-2.68.3-skip_warnings-1.patch || wget https://www.linuxfromscratch.org/patches/blfs/svn/glib-2.68.3-skip_warnings-1.patch

        export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
        export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

	sed 's/close_range (.[^)]*/&, 0/' -i glib/gspawn.c
	test -d build || mkdir build
	cd build &&
	meson --prefix=/usr \
	      --buildtype=release \
	      -Dman=true          \
	      -Dselinux=disabled  \
	      --cross-file ../../riscv64.txt \
	      ..                  &&
	ninja
        test $? -eq 0 || exit 0
else
        echo pass
fi

# https://download.gnome.org/sources/libgsf/1.14/libgsf-1.14.47.tar.xz
cd ~/rpmbuild/SOURCES
if [ ! -f $SYSROOT/usr/local/lib/libgsf.la ]; then
	
	test -e libgsf-1.14.47.tar.xz || wget https://download.gnome.org/sources/libgsf/1.14/libgsf-1.14.47.tar.xz
	test -d libgsf-1.14.47 || tar -xvf libgsf-1.14.47.tar.xz && cd libgsf-1.14.47

	export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
	export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

        ./configure --prefix=$SYSROOT/usr \
                    --host=riscv64-unknown-linux-gnu \
		    --disable-static &&
	make -j$(nproc) && make install
	test $? -eq 0 || exit 0
else
	echo pass
fi

# db-4.8.30.tar.gz
cd ~/rpmbuild/SOURCES
if [ ! -f $SYSROOT/usr/local/lib/libdb-4.8.la ]; then
	
	test -e db-4.8.30.tar.gz || wget https://src.fedoraproject.org/repo/pkgs/db4/db-4.8.30.tar.gz
	test -d db-4.8.30 || tar -xvf db-4.8.30.tar.gz && cd db-4.8.30
	
	cd build_unix/
	../dist/configure --prefix=$SYSROOT/usr/local/ \
        	          --host=riscv64-unknown-linux-gnu && \
	make -j$(nproc) && make install
	test $? -eq 0 || exit 0
else
	echo pass: db-4.8.30.tar.gz
fi

# lzo-2.10.tar.gz
cd ~/rpmbuild/SOURCES
if [ ! -f $SYSROOT/usr/lib/liblzo2.la ]; then
	
	test -e lzo-2.10.tar.gz || wget https://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz
	test -d lzo-2.10 || tar -xvf lzo-2.10.tar.gz &&	cd lzo-2.10
	
	./configure --prefix=$SYSROOT/usr            \
		    --host=riscv64-unknown-linux-gnu \
        	    --enable-shared                  \
        	    --disable-static                 \
        	    --docdir=$SYSROOT/usr/share/doc/lzo-2.10 && \
	make -j$(nproc) && make install
	test $? -eq 0 || exit 0
else
	echo pass: lzo-2.10.tar.gzz
fi

# libsoup-2.72.0.tar.xz
cd ~/rpmbuild/SOURCES
if [ ! -f $SYSROOT/usr/lib/libsoup.la ]; then
        
	test -e libsoup-2.72.0.tar.xz || wget https://download.gnome.org/sources/libsoup/2.72/libsoup-2.72.0.tar.xz
	test -e libsoup-2.72.0-testsuite_fix-1.patch || wget https://www.linuxfromscratch.org/patches/blfs/svn/libsoup-2.72.0-testsuite_fix-1.patch
        test -d libsoup-2.72.0 || tar -xvf libsoup-2.72.0.tar.xz || cd libsoup-2.72.0
	
	patch -Np1 -i ../libsoup-2.72.0-testsuite_fix-1.patch
	meson   --prefix=$SYSROOT/usr  \
		--host=riscv64-unknown-linux-gnu \
		--buildtype=release    \
  		-Dvapi=enabled         \
  		-Dgssapi=disabled   .. && \
	ninja && ninja install
	test $? -eq 0 || exit 0
else
        echo pass: libsoup-2.72.0.tar.xz
fi

# libgrss-0.7.0.tar.xz 
cd ~/rpmbuild/SOURCES
if [ ! -f $SYSROOT/usr/lib/libgrss.la ]; then
        
	test -e libgrss-0.7.0.tar.xz || wget https://download.gnome.org/sources/libgrss/0.7/libgrss-0.7.0.tar.xz
	test -e libgrss-0.7.0-bugfixes-1.patch || wget https://www.linuxfromscratch.org/patches/blfs/svn/libgrss-0.7.0-bugfixes-1.patch
        test -d libgrss-0.7.0 || tar -xvf libgrss-0.7.0.tar.xz && cd libgrss-0.7.0

	patch -Np1 -i ../libgrss-0.7.0-bugfixes-1.patch &&
	autoreconf -fv &&
        ./configure --prefix=$SYSROOT/usr            \
                    --host=riscv64-unknown-linux-gnu \
                    --disable-static                 &&
        make -j$(nproc) && make install
	test $? -eq 0 || exit 0
else
        echo pass: libgrss-0.7.0.tar.xz
fi

