all: build/agreement.pdf build/agreement.html build/worksheet.pdf build/worksheet.html

build/%.html: %.md | build
	pandoc -o $@ -f commonmark $<

build/%.pdf: %.md | build
	pandoc -o $@ -V fontsize=12pt -f commonmark+smart $<

build:
	mkdir -p build

.PHONY: clean

clean:
	rm -rf build
