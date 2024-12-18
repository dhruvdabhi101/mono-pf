MD_FILES := $(wildcard blogs/*.md)
HTML_FILES := $(MD_FILES:blogs/%.md=public/%.html)

all: $(HTML_FILES)

public:
	mkdir -p public

public/%.html: blogs/%.md template.html Makefile | public
	pandoc --toc -s --css ../reset.css --css ../index.css -i $< -o $@ --template=template.html

index.html: index.md template.html Makefile
	pandoc --toc -s --css reset.css --css index.css -i $< -o $@ --template=template.html

clean:
	rm -rf public

.PHONY: all clean
