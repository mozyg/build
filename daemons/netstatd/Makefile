NAME     = netstatd
TITLE    = Netstat Daemon
APP_ID   = org.daemon.de.netstatd
VERSION  = 1.0.16
TYPE     = Linux Daemon
CATEGORY = System Utilities
HOMEPAGE = http://www.daemon.de/PalmPreNetstat
ICON     = http://www.daemon.de/images/netstat.png
DESCRIPTION = This daemon is required for the netstat app. It runs as a background process, collects interface statistic data and stores them in a sql database (on /media/internal/)
CHANGELOG = 1.0.16: fixed 1e+03 MB bug<br/>1.0.15: another Makefile fix: copy netstatd to install backup from source<br/>1.0.14: fixed build Makefile bug<br/>1.0.13: fixed prerm and postinst scripts, update works now even if previously prerm failed, added netstatd.in so postinst will be able to fix failed prerm run<br/>1.0.12: not published<br/>1.0.11: checking if ppp stats file in /sys exists instead of just opening it. replaced all expr calculations by call to math() which uses awk<br/>1.0.10: fixed integer overflow and expr rounding bug, fixed prefs and db dir location bug, now it migrates old db dir if running on webos 1.3.5 or above<br/>1.0.9: forgot the tx counter in the last update<br/>1.0.8: Fixed 10MB bug (non counting after this) by using /sys/classes instead of proc files<br/>Check in both old and new locations for prefs and database<br>1.0.7: added palm pixi support, fixed prerm script bug, added support for traffic limit flag<br/>1.0.6: bugfix: aggregate() didnt work correctly, added history function (called on aggregate)<br/>1.0.5: keeping track if reset have already been done(bugfix)<br/>support forced reset by user via app preferences db<br/>fetching startday from preferences db instead of using hardwired value<br/>1.0.4: fixed upstart script, did not stop correctly<br/>1.0.3: fixed respawning of daemon by upstart<br/>1.0.2: fixed upstart script (removed start wrapper netstatd.in)<br/>1.0.1: renamed the daemon<br/>moved to /usr/sbin<br/>added check if running on moved offline-root<br/>1.0.0: initial commit
SCREENSHOTS = 
LICENSE  = BSD Open Source License

SRC_GIT = git://git.webos-internals.org/daemons/netstatd.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked
	rm -rf build/all
	mkdir -p build/all/usr/sbin/
	install -m 755 build/src/usr/sbin/netstatd build/all/usr/sbin/
	install -m 755 build/src/usr/sbin/netstatd build/all/usr/sbin/netstatd.in
	mkdir -p build/all/etc/event.d
	install -m 755 build/src/upstart/${APP_ID} build/all/etc/event.d/
	touch $@

build/all/CONTROL/prerm: build/.unpacked
	rm -f $@
	mkdir -p build/all/CONTROL
	install -m 0775 build/src/control/prerm build/all/CONTROL
	chmod ugo+x $@

build/all/CONTROL/postinst: build/.unpacked
	rm -f $@
	mkdir -p build/all/CONTROL
	install -m 0775 build/src/control/postinst build/all/CONTROL
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build
