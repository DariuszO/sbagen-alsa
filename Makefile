# build sbagen
all:
	sh build-libs.sh
	gcc -DT_LINUX_ALSA -Wno-unused-but-set-variable -Wno-maybe-uninitialized -Wno-unused-variable -Wno-int-conversion -Wno-incompatible-pointer-types -Wno-implicit-function-declaration -Wno-error -Wno-all -g -O3 -s -o sbagen sbagen.c -lm -lpthread `pkg-config --cflags alsa` -DOGG_DECODE `pkg-config --libs alsa` `pkg-config --libs vorbisfile` -lpthread

# clean house
clean:
	rm -f $(OBJS) $(OUT)

