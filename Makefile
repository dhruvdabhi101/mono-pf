# Get all markdown files in blogs directory
MD_FILES := $(wildcard blogs/*.md)
# Convert markdown file paths to desired html file paths
HTML_FILES := $(MD_FILES:blogs/%.md=public/%.html)

# Default target
all: $(HTML_FILES)

# Create public directory if it doesn't exist
public:
	mkdir -p public

# Rule to convert each markdown file to html
public/%.html: blogs/%.md template.html Makefile | public
	pandoc --toc -s --css ../reset.css --css ../index.css -i $< -o $@ --template=template.html

index.html: index.md template.html Makefile
	pandoc --toc -s --css reset.css --css index.css -i $< -o $@ --template=template.html

# Clean generated files
clean:
	rm -rf public

.PHONY: all clean