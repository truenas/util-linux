#!/bin/bash -ex
VERSION=2.38.1
REVISION=5

wget http://ftp.debian.org/debian/pool/main/u/util-linux/util-linux_$VERSION-$REVISION.debian.tar.xz
tar xf util-linux_$VERSION-$REVISION.debian.tar.xz
rm util-linux_$VERSION-$REVISION.debian.tar.xz

wget http://ftp.debian.org/debian/pool/main/u/util-linux/util-linux_$VERSION.orig.tar.xz
tar xf util-linux_$VERSION.orig.tar.xz --strip 1
rm util-linux_$VERSION.orig.tar.xz

cp NAS-130825-1.patch debian/patches
cp NAS-130825-2.patch debian/patches
echo 'NAS-130825-1.patch' >> debian/patches/series
echo 'NAS-130825-2.patch' >> debian/patches/series

cat changelog debian/changelog > temp_changelog
mv -f temp_changelog debian/changelog
