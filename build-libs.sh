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

./configure || exit 1
make -j$(nproc) || exit 1

echo ""

cp -v .libs/libmad.a ../libs/linux-libmad.a || {
    echo libmad.a missing; exit 1; }

cp -v mad.h ../libs/ || {
    echo Header file missing; exit 1; }

make clean >/dev/null 2>&1

echo LIBMAD DONE

cd .. && cd tremor || { echo "tremor directory not found!!"; exit 1; }

./autogen.sh || exit 1
make -j$(nproc) || exit 1

echo ""

cp -v .libs/libvorbisidec.a ../libs/linux-libvorbisidec.a || {
    echo libvorbisidec.a missing; exit 1; }

cp -v ivorbiscodec.h ivorbisfile.h ogg.h os_types.h config_types.h ../libs/ || {
    echo Not all expected header files present; exit 1; }

make clean >/dev/null 2>&1

echo VORBIS DONE

cd ..

echo ""
