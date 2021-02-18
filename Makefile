formats=pdf html docx odt rtf
forms=agreement worksheet

all: $(addprefix build/,$(foreach format,$(formats),$(addsuffix .$(format),$(forms))))

from=commonmark+smart

build/%.html: %.md | build
	pandoc -o $@ -f $(from) $<

build/%.pdf: %.md | build
	pandoc -o $@ -V fontsize=12pt -f $(from) $<

build/%.odt: %.md | build
	pandoc -o $@ -f $(from) $<

build/%.docx: %.md | build
	pandoc -o $@ -f $(from) $<

build/%.rtf: %.md | build
	pandoc -o $@ -f $(from) --standalone $<

build:
	mkdir -p build

.PHONY: clean

clean:
	rm -rf build
