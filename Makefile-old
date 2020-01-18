# build sbagen
all:
	git submodule update
	sh build-libs.sh
	gcc -std=gnu18 -DT_LINUX_ALSA -Wall -g -O2 -o sbagen -ggdb -fno-omit-frame-pointer sbagen.c -lm -lpthread `pkg-config --cflags alsa` -DOGG_DECODE `pkg-config --libs alsa` `pkg-config --libs vorbisfile`

# clean house
clean:
	rm -f $(OBJS) $(OUT) sbagen

