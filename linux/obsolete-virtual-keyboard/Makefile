TYPE = Linux Application
NAME = virtual-keyboard
VERSION = 0.4.3
TITLE = OBSOLETE Virtual Keyboard
MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
DESCRIPTION = Only install this if you need to remove keyboard files that show up in ipkg log as files that would be created when trying to install the virtual keyboard patch.  
APP_ID = org.webosinternals.${NAME}
CATEGORY = Utilities
#DEPENDS = org.webosinternals.patch, org.webosinternals.diffstat

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk
include ../../support/download.mk


.PHONY: unpack
unpack: build/.unpacked

build/.unpacked:
	rm -rf build
	mkdir -p build
	touch $@

build/all/CONTROL/postinst: build/.unpacked
	mkdir -p build/all/CONTROL
	cp postinst build/all/CONTROL/postinst
	chmod ugo+x $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	touch $@

.PHONY: clobber
clobber::
	rm -rf build