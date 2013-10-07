HOSTNAME = $(shell hostname -s)
BUILDTIME = $(shell date -R)
KVERS = $(shell strings ../vmlinux | awk '/Linux version/ {print $$3}' | head -1)

default: logo.rle

from565.bin:
	gcc -o from565.bin from565.c

rgb2565.bin:
	gcc -o rgb2565.bin rgb2565.c

logo.raw: from565.bin
	./from565.bin -rle < original_logo.rle > logo.raw

tagged.raw: logo.raw
	convert -depth 8 -size 1080x1920 rgb:logo.raw -gravity NorthWest -fill '#505050'  -pointsize 22 \
	-draw "text 10,1890 'Kernel: $(KVERS), built by $(USER)@$(HOSTNAME) on $(BUILDTIME)'"  rgb:tagged.raw

logo.rle: tagged.raw rgb2565.bin
	./rgb2565.bin -rle < tagged.raw > logo.rle

clean:
	rm -f *.bin *.raw logo.rle

