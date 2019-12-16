# build sbagen
all:
	sh build-libs.sh
	gcc -std=c++11 -DT_LINUX_ALSA -Wall -g -O3 -s -o sbagen sbagen.c -lm -lpthread  `pkg-config --cflags alsa` -DOGG_DECODE `pkg-config --libs alsa` `pkg-config --libs vorbisfile`

# clean house
clean:
	rm -f $(OBJS) $(OUT)

