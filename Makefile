.PHONY: clean

all: dst

dst: src
	mkdir -p dst
	ssg src dst 'William Culhane' 'culhane.top'

clean:
	rm -rf dst
