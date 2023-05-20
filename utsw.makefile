DOCNAME=utsw-mouse-slides


all: $(DOCNAME).pdf


$(DOCNAME).html: $(DOCNAME).qmd R/hs_fig.R slides.css research.bib figs/lrt-v-middle-of-gene-slides.svg figs/lrt-v-univariate-lod-slides.svg
	quarto render $<

$(DOCNAME).pdf: $(DOCNAME).html
	R -e "file <- paste0('file://', normalizePath('$^'));webshot::webshot(file, '$@', delay = 5)"
	
clean:
	rm -R $(DOCNAME)_files; rm $(DOCNAME).pdf; rm $(DOCNAME).html