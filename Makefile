# Rules for compiling the PDF from the LaTeX sources and displaying the output

### Documents to build
PDF = projeto.pdf
### File Types (for dependencies)
TEX = $(filter-out $(PDF:.pdf=.tex), $(wildcard *.tex))
BIB = $(wildcard *.bib)
FIG = $(wildcard figures/*)

all: $(PDF)

%.pdf: %.tex $(TEX) $(BIB) $(FIG)
	tectonic -X compile $<

clean:
	rm -f $(PDF)
