.PHONY: clean

all: site.tar.gz

dst: src
	mkdir -p dst
	ssg src dst 'William Culhane' 'culhane.top'

site.tar.gz: dst
	tar --exclude=.files -cvzC dst/ . > site.tar.gz

clean:
	rm -rf dst
	rm -f site.tar.gz
