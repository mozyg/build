# Makefile for PreWare application packaging
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

package: ipkgs/${APP_ID}_${VERSION}_${PLATFORM}.ipk

ipkgs/${APP_ID}_${VERSION}_${PLATFORM}.ipk: build/.built
	rm -f ipkgs/${APP_ID}_*_${PLATFORM}.ipk
	rm -f build/${NAME}/CONTROL/control
	${MAKE} build/${NAME}/CONTROL/control
	rm -f build/${NAME}/CONTROL/postinst
	${MAKE} build/${NAME}/CONTROL/postinst
	mkdir -p ipkgs
	( cd build ; \
	  TAR_OPTIONS=--wildcards \
	  ../../../toolchain/ipkg-utils/ipkg-build -o 0 -g 0 ${NAME} )
	mv build/${APP_ID}_${VERSION}_${PLATFORM}.ipk $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/${NAME}/CONTROL
	echo "#!/bin/sh" > $@
	echo "/usr/bin/luna-send palm://com.palm.applicationManager/rescan {}" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

build/${NAME}/CONTROL/control: build/${NAME}/usr/palm/applications/${APP_ID}/appinfo.json
	rm -f $@
	mkdir -p build/${NAME}/CONTROL
	echo "Package: ${APP_ID}" > $@
	echo -n "Version: " >> $@
ifdef VERSION
	echo "${VERSION}" >> $@
else
	sed -ne 's|^[[:space:]]*"version":[[:space:]]*"\(.*\)",[[:space:]]*$$|\1|p' $< >> $@
endif
	echo "Architecture: all" >> $@
	echo -n "Maintainer: " >> $@
ifdef MAINTAINER
	echo "${MAINTAINER}" >> $@
else
	sed -ne 's|^[[:space:]]*"vendor":[[:space:]]*"\(.*\)",[[:space:]]*|\1|p' $< | tr -d '\n' >> $@
	echo -n " <" >> $@
	sed -ne 's|^[[:space:]]*"vendor_email":[[:space:]]*"\(.*\)",[[:space:]]*|\1|p' $< | tr -d '\n' >> $@
	echo ">" >> $@
endif
	echo -n "Description: " >> $@
ifdef DESCRIPTION
	echo "${DESCRIPTION}" >> $@
else
	sed -ne 's|^[[:space:]]*"title":[[:space:]]*"\(.*\)",[[:space:]]*$$|\1|p' $< >> $@
endif
	echo -n "Section: " >> $@
ifdef SECTION
	echo "${SECTION}" >> $@
else
	sed -ne 's|^[[:space:]]*"type":[[:space:]]*"\(.*\)",[[:space:]]*$$|\1|p' $< >> $@
endif
ifdef PRIORITY
	echo "${PRIORITY}" >> $@
else
	echo "Priority: optional" >> $@
endif
ifdef DEPENDS
	echo "Depends: ${DEPENDS}" >> $@
endif
ifdef CONFLICTS
	echo "Conficts: ${CONFLICTS}" >> $@
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
ifdef SRC_GIT
	echo "${SRC_GIT}" >> $@
endif
endif
	touch $@

clobber::
	$(call PREWARE_SANITY)
	rm -rf ipkgs

