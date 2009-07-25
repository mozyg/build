# Makefile for PreWare plugin packaging
#
# Copyright (C) 2009 by Rod Whitby <rod@whitby.id.au>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
#

.PHONY: package clobber

ifndef NAME
PREWARE_SANITY += $(error "Please define NAME in your Makefile")
endif

package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk

ipkgs/${APP_ID}_${VERSION}_%.ipk: build/.built
	rm -f build/$*/CONTROL/control
	${MAKE} build/$*/CONTROL/control
	rm -f $@
	mkdir -p ipkgs
	( cd build ; \
	  TAR_OPTIONS=--wildcards \
	  ../../../toolchain/ipkg-utils/build/ipkg-utils/ipkg-build -o 0 -g 0 $* )
	mv build/${APP_ID}_${VERSION}_$*.ipk $@

build/%/CONTROL/control:
	rm -f $@
	mkdir -p build/$*/CONTROL
	echo "Package: ${APP_ID}" > $@
ifdef VERSION
	echo -n "Version: " >> $@
	echo "${VERSION}" >> $@
endif
	echo "Architecture: $*" >> $@
ifdef MAINTAINER
	echo -n "Maintainer: " >> $@
	echo "${MAINTAINER}" >> $@
endif
ifdef DESCRIPTION
	echo -n "Description: " >> $@
	echo "${DESCRIPTION}" >> $@
endif
ifdef SECTION
	echo -n "Section: " >> $@
	echo "${SECTION}" >> $@
endif
ifdef PRIORITY
	echo "${PRIORITY}" >> $@
else
	echo "Priority: optional" >> $@
endif
	echo -n "Source: " >> $@
ifdef SOURCE
	echo "${SOURCE}" >> $@
else
ifdef SRC_IPKG
	echo "${SRC_IPKG}" >> $@
endif
ifdef SRC_TGZ
	echo "${SRC_TGZ}" >> $@
endif
ifdef SRC_ZIP
	echo "${SRC_ZIP}" >> $@
endif
endif
	touch $@

clobber::
	$(call PREWARE_SANITY)
	rm -rf ipkgs
