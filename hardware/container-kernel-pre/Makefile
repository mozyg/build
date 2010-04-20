NAME = $(shell basename $(shell pwd))
TITLE = Container-Kernel (Palm Pre/Pre+)
DESCRIPTION = Kernel build tree for container related experiments<br>\
<b>Note that usage of this package is very likely to void your warranty if things go wrong.<b>
CATEGORY = Experimental
VERSION = 1.4.1-1
VERSIONS = ${VERSION}
SCREENSHOTS = 

HOMEPAGE = http://wdtz.org/cs523/
KERNEL_GIT = git@wdtz.org:cs523/kernel.git

include ../../support/kernel.mk

#Override some rules
build/src-%/linux-${KERNEL_VERSION}:
	mkdir -p build/src-$*
	git clone $(KERNEL_GIT) build/src-$*/linux-${KERNEL_VERSION} -b palm_lxc

updated-${VERSION}: build/src-${VERSION}/linux-${KERNEL_VERSION}
	cd build/src-${VERSION} && git pull

build/.unpacked-${VERSION}: updated-${VERSION}
