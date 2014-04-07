.SUFFIXES:
.SUFFIXES: .fig

#FIGS=$(wildcard images/figs/*.fig)
#OUT_PDF=$(FIGS:fig=pdf)
#OUT_EPS=$(FIGS:fig=eps)

all: pdf

pdfa: thesis_pdfa.pdf
pdf: thesis.pdf
ps: thesis.ps
dvi: thesis.dvi

thesis_pdfa.pdf: thesis.ps
	ps2pdfa.sh thesis.ps thesis_pdfa.pdf

thesis.pdf: thesis.ps
	ps2pdf thesis.ps thesis.pdf

thesis.ps: thesis.dvi
	dvips -Ppdf -G0 -o thesis.ps thesis.dvi

#thesis.dvi: figs *.tex text/*.tex
thesis.dvi:  *.tex text/*.tex
	latex thesis.tex < /dev/null
	bibtex thesis
	latex thesis < /dev/null
	latex thesis < /dev/null

#figs: $(OUT_PDF) $(OUT_EPS) copyfigs

copyfigs:
	cp images/figs/*.pdf images/
	cp images/figs/*.eps images/

%.pdf: %.fig
	fig2dev -L pdf $< $@

%.eps: %.fig
	fig2dev -L eps $< $@

clean:
	rm -f *.dvi *.aux *.log *.ps *.toc *.lof *.lot *.lol *.out *.bbl *.blg images/figs/*.pdf images/figs/*.eps

