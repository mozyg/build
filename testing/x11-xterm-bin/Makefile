NAME     = xterm-bin
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.0.2
DEPENDS  = org.webosinternals.xlib
HOMEPAGE = http://www.webos-internals.org/wiki/Application:X
MAINTAINER = Will Dietz (dtzWill), WebOSInternals
TITLE   = XTerm Binaries
TYPE	 = Linux Application
DESCRIPTION = Binaries for the X Window System Terminal Application<br>You probably want to install the XTerm application instead of this package.
CHANGELOG = <br>0.0.2<br>First release.
CATEGORY = X Window System
ICON	= http://www.webos-internals.org/images/a/a5/X.png
LICENSE  = MIT/X11 License
SCREENSHOTS = []

SRC_GIT = git://git.webos-internals.org/x11/${NAME}-pkg.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpack
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	touch $@

build/%/usr/palm/applications/${APP_ID}/CONTROL/control:
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
