#!/bin/sh

if [ $1 ]; then
	rpm_pkg=$1
	test !-e $1 || echo remove package: $rpm_pkg && \
		rpm -qpi $rpm_pkg && \
		rpm -qpl $rpm_pkg && \
		rpm -qpl $rpm_pkg | xargs -i rm -f {} && \
		echo uninstall $rpm_pkg successfully
fi
