.PHONY: all clean

SRCFILES := $(shell find src)

all: site.tar.gz

dst: $(SRCFILES)
	mkdir -p dst
	./bin/ssg src dst 'William Culhane' 'wculhane.com'

site.tar.gz: dst
	tar --exclude=.files -cvzC dst/ . > site.tar.gz

clean:
	rm -rf dst
	rm -f site.tar.gz
