# Rules for compiling the PDF from the LaTeX sources and displaying the output

### File Types (for dependencies)
TEX = $(wildcard *.tex)
BIB = $(wildcard *.bib)
FIG = $(wildcard figures/*)
### Documents to build
PDF = $(TEX:.tex=.pdf)

all: $(PDF)

%.pdf: %.tex $(TEX) $(BIB) $(FIG)
	tectonic -X compile $<

show: $(PDF)
	for f in *.pdf; do xdg-open $$f; done

clean:
	rm -f $(PDF)
