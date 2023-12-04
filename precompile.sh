#! /bin/bash

#
# x86_64
#

echo "Building for x86_64"

./configure \
	CC=musl-gcc \
	--disable-shared \
	--host x86_64-unknown-linux-musl \
	--enable-ipv6 \
	--without-libnl
make -j$(nproc)

mkdir -p out/x86_64
cp -v libpcap.a out/x86_64/libpcap.a

make clean

echo "Built x86_64"

#
# rpi
#

echo "Building for rpi"

./configure \
	CC=aarch64-linux-musl-gcc \
	--disable-shared \
	--host aarch64-unknown-linux-musl \
	--enable-ipv6 \
	--without-libnl
make -j$(nproc)

mkdir -p out/rpi
cp -v libpcap.a out/rpi/libpcap.a

make clean

echo "Built rpi"
