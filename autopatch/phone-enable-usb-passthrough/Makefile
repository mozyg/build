NAME = $(shell basename $(shell pwd))
PATCH = phone/${NAME}.patch
TITLE = Enable USB Passthrough
DESCRIPTION = This patch does two things:<br/>1) Bypasses the validation screen, so you no longer have to enter a code.<br/>2) Adds the USB Passthrough icon to the launcher, so you no longer have to manually enter the USBPASS code.<br/><br/>This is useful to enable Diagnostics mode for modifications such as enabling standalone GPS.<br/><br/>There are also a couple of interesting modes in USB Passthrough including a GPS mode and USBNet.
CATEGORY = Phone
VERSIONS = 1.3.5-14 1.4.0-24 1.4.1-1
ICON = http://www.webos-internals.org/images/2/2c/Icon_WebOSInternals_Patches_Phone.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/f/f7/Phone-enable-usb-passthrough-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Ebag333 <ebagola@gmail.com>
HOMEPAGE = http://forums.precentral.net/webos-patches/223956-patch-usb-passthrough-remove-code-add-launcher-usbpass.html
