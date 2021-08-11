#!/bin/bash

source build-utils.h

# [PASS]
parse_url https://src.fedoraproject.org/repo/pkgs/db4/db-4.8.30.tar.gz
if [ ! -f $SYSROOT/usr/local/lib/libdb-4.8.so ]; then
	cd build_unix/
	../dist/configure --prefix=$SYSROOT/usr/local/ \
        	          --host=riscv64-unknown-linux-gnu && \
	make_install && epilog
fi

# [PASS]
parse_url https://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz
if [ ! -f $SYSROOT/usr/lib/liblzo2.so.2.0.0 ]; then
	./configure --prefix=$SYSROOT/usr            \
		    --host=riscv64-unknown-linux-gnu \
        	    --enable-shared                  \
        	    --disable-static                 \
        	    --docdir=$SYSROOT/usr/share/doc/lzo-2.10 &&
	make_install && epilog
fi

# [PASS]
parse_url https://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz
if [ ! -f $SYSROOT/usr/lib/pkgconfig/readline.pc ]; then
	./configure --prefix=$SYSROOT/usr \
		    --host=riscv64-unknown-linux-gnu &&
	make_install && epilog
fi

# [PASS]
parse_url https://ftp.pcre.org/pub/pcre/pcre-8.45.tar.bz2
if [ ! -f $SYSROOT/usr/lib/pkgconfig/libpcre.pc ]; then
	./configure --prefix=%{?buildroot}/usr/ \
            --host=riscv64-unknown-linux-gnu \
            --docdir=%{?buildroot}/usr/share/doc/pcre-8.45 \
            --enable-unicode-properties       \
            --enable-pcre16                   \
            --enable-pcre32                   \
            --enable-pcregrep-libz            \
            --disable-static                 &&
	 make_install && epilog
fi

# [PASS]
parse_url https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2
if [ ! -f $SYSROOT/usr/lib/pkgconfig/libpcre2-posix.pc ]; then
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

# [PASS]
# Required: pcre2-10.37
parse_url https://github.com/storaged-project/libbytesize/releases/download/2.6/libbytesize-2.6.tar.gz
if [ ! -f $SYSROOT/usr/lib/pkgconfig/readline.pc ]; then
	./configure --prefix=$SYSROOT/usr \
		    --host=riscv64-unknown-linux-gnu &&
        make_install && epilog
fi

parse_url https://download.gnome.org/sources/glib/2.68/glib-2.68.3.tar.xz
if [ ! -f $SYSROOT/usr/local/lib/libglib.la ]; then

	install_patch https://www.linuxfromscratch.org/patches/blfs/svn/glib-2.68.3-skip_warnings-1.patch

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
	ninja_install && epilog
fi

parse_url https://download.gnome.org/sources/libgsf/1.14/libgsf-1.14.47.tar.xz
if [ ! -f $SYSROOT/usr/local/lib/libgsf.la ]; then

	export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
	export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

        ./configure --prefix=$SYSROOT/usr \
                    --host=riscv64-unknown-linux-gnu \
		    --disable-static &&
	make_install && epilog
fi


parse_url https://download.gnome.org/sources/libsoup/2.72/libsoup-2.72.0.tar.xz
if [ ! -f $SYSROOT/usr/lib/libsoup.la ]; then
        
	install_patch https://www.linuxfromscratch.org/patches/blfs/svn/libsoup-2.72.0-testsuite_fix-1.patch
	
	meson   --prefix=$SYSROOT/usr  \
		--host=riscv64-unknown-linux-gnu \
		--buildtype=release    \
  		-Dvapi=enabled         \
  		-Dgssapi=disabled   .. &&
	ninja_install && epilog
fi

parse_url https://download.gnome.org/sources/libgrss/0.7/libgrss-0.7.0.tar.xz
if [ ! -f $SYSROOT/usr/lib/libgrss.la ]; then
	install_patch https://www.linuxfromscratch.org/patches/blfs/svn/libgrss-0.7.0-bugfixes-1.patch

	autoreconf -fv &&
        ./configure --prefix=$SYSROOT/usr            \
                    --host=riscv64-unknown-linux-gnu \
                    --disable-static                 &&
	make_install && epilog
fi

