#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            https://blog.packagecloud.io
make PREFIX=/usr %{?_smp_mflags}
make PREFIX=/usr DESTDIR=$SYSROOT install

epilog

