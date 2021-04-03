.PHONY: clean

all: dst

dst: src
	mkdir -p dst
	ssg src dst 'Will' 'culhane.top'

clean:
	rm -rf dst
