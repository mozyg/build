NAME = $(shell basename $(shell pwd))
PATCH = notifications/${NAME}.patch
TITLE = Advanced Reset Options
DESCRIPTION = On power button hold, it goes straight to the reset options, with airplane mode, java restart, and luna restart added, and skips the swap-battery/shutdown prompt.
CATEGORY = Notifications
VERSIONS = 1.3.5-23 1.4.0-12 1.4.1-1
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1 

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/223829-patch-advanced-reset-options.html
