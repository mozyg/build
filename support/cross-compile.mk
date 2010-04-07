CROSS_COMPILE_armv7 = $(shell cd ../.. ; pwd)/toolchain/cs08q1armel/build/arm-2008q1/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_armv6 = $(shell cd ../.. ; pwd)/toolchain/cs08q1armel/build/arm-2008q1/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_arm   = $(shell cd ../.. ; pwd)/toolchain/cs08q1armel/build/arm-2008q1/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_i686  = $(shell cd ../.. ; pwd)/toolchain/i686-unknown-linux-gnu/build/i686-unknown-linux-gnu/bin/i686-unknown-linux-gnu-

STAGING_DIR_armv7 = $(shell cd ../.. ; pwd)/staging/armv7
STAGING_DIR_armv6 = $(shell cd ../.. ; pwd)/staging/armv6
STAGING_DIR_arm   = $(shell cd ../.. ; pwd)/staging/armv7
STAGING_DIR_i686  = $(shell cd ../.. ; pwd)/staging/i686