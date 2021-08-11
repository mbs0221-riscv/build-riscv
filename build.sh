#!/bin/bash

source ./scripts/build-utils.h

parse_url https://download.gnome.org/sources/glib/2.68/glib-2.68.3.tar.xz
if [ ! -f %{?buildroot}/usr/local/lib/libglib.la ]; then

	install_patch https://www.linuxfromscratch.org/patches/blfs/svn/glib-2.68.3-skip_warnings-1.patch

        export PKG_CONFIG_PATH=%{?buildroot}/usr/lib/pkgconfig:$PKG_CONFIG_PATH
        export PKG_CONFIG_PATH=%{?buildroot}/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
	
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
if [ ! -f %{?buildroot}/usr/local/lib/libgsf.la ]; then

	export PKG_CONFIG_PATH=%{?buildroot}/usr/lib/pkgconfig:$PKG_CONFIG_PATH
	export PKG_CONFIG_PATH=%{?buildroot}/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

        ./configure --prefix=%{?buildroot}/usr \
                    --host=riscv64-unknown-linux-gnu \
		    --disable-static &&
	make_install && epilog
fi


parse_url https://download.gnome.org/sources/libsoup/2.72/libsoup-2.72.0.tar.xz
if [ ! -f %{?buildroot}/usr/lib/libsoup.la ]; then
        
	install_patch https://www.linuxfromscratch.org/patches/blfs/svn/libsoup-2.72.0-testsuite_fix-1.patch
	
	meson   --prefix=%{?buildroot}/usr  \
		--host=riscv64-unknown-linux-gnu \
		--buildtype=release    \
  		-Dvapi=enabled         \
  		-Dgssapi=disabled   .. &&
	ninja_install && epilog
fi

parse_url https://download.gnome.org/sources/libgrss/0.7/libgrss-0.7.0.tar.xz
if [ ! -f %{?buildroot}/usr/lib/libgrss.la ]; then
	install_patch https://www.linuxfromscratch.org/patches/blfs/svn/libgrss-0.7.0-bugfixes-1.patch

	autoreconf -fv &&
        ./configure --prefix=%{?buildroot}/usr            \
                    --host=riscv64-unknown-linux-gnu \
                    --disable-static                 &&
	make_install && epilog
fi

