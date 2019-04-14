DOCNAME=diss-slides


all: $(DOCNAME).pdf


$(DOCNAME).html: $(DOCNAME).Rmd R/hs_fig.R slides.css research.bib figs/nonlocal-4-panels-no-strip-wide.svg figs/12local-facet_grid-no-strip-3-by-4.svg figs/Hnf4a-lod-diff-prop-v-lrt.svg figs/lod-diff-prop-v-lrt.svg
	R -e "rmarkdown::render('$<')"


$(DOCNAME).pdf: $(DOCNAME).html
	R -e "file <- paste0('file://', normalizePath('$^'));webshot::webshot(file, '$@', delay = 3)"
	
	