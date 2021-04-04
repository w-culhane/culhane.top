.PHONY: clean

all: tar

dst: src
	mkdir -p dst
	ssg src dst 'William Culhane' 'culhane.top'

tar: dst
	tar --exclude=.files -cvzC dst/ . > site.tar.gz

clean:
	rm -rf dst
	rm -f site.tar.gz
