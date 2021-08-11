#!/bin/sh

if [ $1 ]; then
	rpm_pkg=$1
	test !-e $1 || echo install package: $rpm_pkg && \
		rpm -qpi $rpm_pkg && \
	       	rpm -qpl $rpm_pkg && \
		rpm -i $rpm_pkg && \
		echo install $rpm_pkg successfullly
fi
