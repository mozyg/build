NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TITLE = Device Menu Remix
DESCRIPTION = Removes the date, undims the battery level, adds brightness controll, adds GPS toggle, and removes the airplane mode toggle, on the device menu.
CATEGORY = Top Bar
VERSIONS = 1.3.5-13 1.4.0-29 1.4.1-1
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/8/86/Top-bar-device-menu-remix-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/217216-patch-device-menu-remix.html
