NAME = $(shell basename $(shell pwd))
PATCH = camera/${NAME}.patch
TITLE = Video Camera Flashlight
DESCRIPTION = Adds a flashlight toggle in the video recorder of the camera app.
CATEGORY = Camera
VERSIONS = 1.4.0-18 1.4.1-1
ICON = http://www.webos-internals.org/images/c/c5/Icon_WebOSInternals_Patches_Camera.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/232995-patch-video-camera-flashlight.html
