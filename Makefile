all: agreement.pdf agreement.html worksheet.pdf worksheet.pdf

%.html: %.md
	pandoc -o $@ -f commonmark $<

%.pdf: %.md
	pandoc -o $@ -V fontsize=12pt -f commonmark+smart $<
