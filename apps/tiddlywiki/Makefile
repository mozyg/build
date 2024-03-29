NAME     = tiddlywiki
APP_ID   = de.daemon.tiddlywiki
SIGNER   = de.daemon
VERSION  = 1.0.3
DEPENDS  = mobi.optware.lighttpd
HOMEPAGE = http://www.daemon.de/PalmPreTiddlyWiki
MAINTAINER = debilater
TITLE   = Tiddlywiki for Palm Pre
TYPE	= Application
DESCRIPTION = TiddlyWiki is a single-file, self-contained wiki for managing micro-content, written in JavaScript. This is the port to the Palm Pre platform based on ITW (http://itw.bidix.info/). It requires lighttpd to be installed which it uses to save itself via a CGI script to the usb drive. No network connectivity is required to use it. You can copy the wikifile (www/itw.html) to your desktop, modify it there and copy it back to the palm.
CHANGELOG = 1.0.3: fixed install bug in postinst<br/>1.0.2: missed updated cgi in 1.0.1<br/>1.0.1: added help, enhanced about, added on-device restore feature<br/>1.0.0: initial public test release
CATEGORY = Utilities
ICON	= http://www.daemon.de/idisk/palmpre/tiddlywiki/icon.png
LICENSE  = GPL
SCREENSHOTS = [\
\"http://www.daemon.de/idisk/palmpre/tiddlywiki/tiddlywiki_2010-03-03_233233.png\",\
\"http://www.daemon.de/idisk/palmpre/tiddlywiki/tiddlywiki_2010-03-03_214556.png\",\
\"http://www.daemon.de/idisk/palmpre/tiddlywiki/tiddlywiki_2010-03-03_214623.png\",\
\"http://www.daemon.de/idisk/palmpre/tiddlywiki/tiddlywiki_2010-03-03_214636.png\",\
\"http://www.daemon.de/idisk/palmpre/tiddlywiki/tiddlywiki_2010-03-03_220301.png\" ]

SRC_GIT = git://git.webos-internals.org/applications/tiddlywiki.git


.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/src/binaries build/binaries
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv6.built-${VERSION} build/armv7.built-${VERSION} build/i686.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/cgi-bin
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 build/binaries/$*/savetiddlywiki.cgi build/$*/usr/palm/applications/${APP_ID}/cgi-bin/
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



.PHONY: clobber
clobber::
	rm -rf build


