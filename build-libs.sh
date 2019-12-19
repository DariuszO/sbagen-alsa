#!/bin/bash

#
#
#
#

rm -rf libs || exit 1
mkdir -p libs || exit 1

echo ""

cd libmad || { echo "Can't move to libmad directory"; exit 1; }

echo ""

#make clean || exit 0

echo ""

./configure || exit 1
make || exit 1

echo ""

cp -v .libs/libmad.a ../libs/linux-libmad.a || {
    echo libmad.a missing; exit 1; }

cp -v ../oldlib/mad.h ../libs/ || {
    echo Header file missing; exit 1; }

make clean >/dev/null 2>&1

echo LIBMAD DONE

cd .. && cd tremor || { echo "tremor directory not found!!"; exit 1; }

#make clean || exit 1

echo ""

./autogen.sh || exit 1
make || exit 1

echo ""

cp -v .libs/libvorbisidec.a ../libs/linux-libvorbisidec.a || {
    echo libvorbisidec.a missing; exit 1; }

cp -v ../oldlib/ivorbiscodec.h ../libs/ || {
    echo Header file missing; exit 1; }
	
cp -v ../oldlib/ivorbisfile.h ../libs/ || {
    echo Header file missing; exit 1; }
	
cp -v ../oldlib/ogg.h ../libs/ || {
    echo Header file missing; exit 1; }
	
cp -v ../oldlib/os_types.h ../libs/ || {
    echo Header file missing; exit 1; }
	
cp -v ../oldlib/config_types.h ../libs/ || {
    echo Header file missing; exit 1; }

make clean >/dev/null 2>&1

echo VORBIS DONE

cd ..

echo ""
