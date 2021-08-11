#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://blog.packagecloud.io
make PREFIX=/usr %{?_smp_mflags}
make PREFIX=/usr DESTDIR=$SYSROOT install
