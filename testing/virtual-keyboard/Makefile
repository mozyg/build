NAME = add-onscreen-keyboard
VERSIONS = 1.3.5-7 1.4.0-2
META_SUB_VERSION = 5
HOMEPAGE = http://www.webos-internals.org/wiki/On_Screen_Keyboard
TITLE = Virtual Keyboard
CATEGORY = Mojo
ICON = http://www.webos-internals.org/images/0/0f/Icon_WebOSInternals_Keyboard.png
DESCRIPTION = <br>Double-tapping the gesture area (near the round silver button) will bring up the on-screen keyboard if you are in a text input field. Double-tap quickly and wait at least 3 seconds before trying again as a 3rd tap will stop the rendering.  NOTE: The keyboard takes a couple of seconds to render, be patient.  In the Emulator, tap PageUp twice.
CHANGELOG = 1.4.0-2: Moved the theme/configuration files to separate pacakge. <br>1.4.0-1: Port to webOS 1.4.0 and fix undefined bug when tapping theme selector key. <br>1.3.5-4: Fixed bug causing undefined to be displayed in messaging app. <br>1.3.5-3: Fixed bug causing problems in memos app. <br>1.3.1-1: Ported to webos 1.3.1.  Had to remove AutoCorrect due to more strict file access via Mojo in 1.3.1. <br>1.2.1-4: Added AutoCorrect support <br>1.2.1-1: Expanded and optimized keyboard theming and user interface. Now using default theme made by un_designer.
SCREENSHOTS = [\"http://www.webos-internals.org/images/b/b9/VirtualKeyboard_1.png\",\"http://www.webos-internals.org/images/b/bd/VirtualKeyboard_2.png\",\"http://www.webos-internals.org/images/3/34/VirtualKeyboard_3.png\",\"http://www.webos-internals.org/images/1/18/VirtualKeyboard_4.png\",\"http://www.webos-internals.org/images/1/10/VirtualKeyboard_5.png\",\"http://www.webos-internals.org/images/2/2a/VirtualKeyboard_6.png\"]

PATCH = add-onscreen-keyboard.patch

include ../../autopatch/common.mk

DEPENDS := ${DEPENDS}, org.webosinternals.vkb-default-themes-config

ifeq ("${DUMMY_VERSION}", "")

SRC_GIT = git://git.webos-internals.org/patches/virtual-keyboard.git

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mkdir -p build/src-${VERSION}
	tar -C build/src-${VERSION} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

build/all/CONTROL/postinst: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' \
			-e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' \
			../../autopatch/postinst.testing > build/all/CONTROL/postinst
	chmod ugo+x $@

build/all/CONTROL/prerm: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' \
			-e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' ../../autopatch/prerm.testing > build/all/CONTROL/prerm
	chmod ugo+x $@

endif

MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
HOMEPAGE = http://www.webos-internals.org/wiki/On_Screen_Keyboard
