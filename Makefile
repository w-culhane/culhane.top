.PHONY: all clean

SRCFILES := $(shell find src)

all: site.tar.gz

bin/ssg:
	mkdir -p bin
	curl --proto '=https' --tlsv1.2 --max-time 60 \
	--show-error --location --fail --output bin/ssg \
	https://rgz.ee/bin/ssg6 \
	|| curl --proto '=https' --tlsv1.2 --max-time 60 \
	--show-error --location --fail --output bin/ssg \
	https://raw.githubusercontent.com/romanzolotarev/rgz.ee/master/bin/ssg
	chmod u+x bin/ssg

dst: $(SRCFILES) bin/ssg
	mkdir -p dst
	./bin/ssg src dst 'William Culhane' 'wculhane.com'

site.tar.gz: dst
	tar --exclude=.files -cvzC dst/ . > site.tar.gz

clean:
	rm -rf bin
	rm -rf dst
	rm -f site.tar.gz
