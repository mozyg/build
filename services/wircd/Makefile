NAME     = wircd
APP_ID   = us.ryanhope.${NAME}
VERSION  = 0.0.6
HOMEPAGE = http://www.webos-internals.org/wiki/Application:WIRC
MAINTAINER = Ryan Hope <rmh3093@gmail.com>
TITLE	 = wIRCd - WebOS IRC Service
DESCRIPTION = A native C luna service for communicating with IRC servers. So far, only wIRC uses this service.
CHANGELOG = 0.0.6: Corrected the postinst and prerm to work on all known webOS versions.
TYPE	 = Service
CATEGORY = Luna
ICON	= http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_wIRC_Service.png
LICENSE = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/services/wIRCd.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_i686.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked build/src/Makefile: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

build/.built-${VERSION}: build/armv6.built build/armv7.built build/i686.built
	touch $@

build/%.built: build/.unpacked
	rm -rf build/$*
	mkdir -p build/$*/usr/bin
	install -m 755 build/src/binaries/${APP_ID}-$* build/$*/usr/bin/${APP_ID}
	mkdir -p build/$*/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/$*/etc/event.d/${APP_ID}
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
