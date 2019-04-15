DOCNAME=diss-slides


all: $(DOCNAME).pdf


$(DOCNAME).html: $(DOCNAME).Rmd R/hs_fig.R slides.css research.bib figs/lrt-v-middle-of-gene-slides.svg figs/lrt-v-univariate-lod-slides.svg
	R -e "rmarkdown::render('$<')"


$(DOCNAME).pdf: $(DOCNAME).html
	R -e "file <- paste0('file://', normalizePath('$^'));webshot::webshot(file, '$@', delay = 1)"
	
clean:
	rm -R $(DOCNAME)_files; rm $(DOCNAME).pdf; rm $(DOCNAME).html