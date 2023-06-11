DOCNAME=utsw-mouse-slides


all: $(DOCNAME).html


$(DOCNAME).html: $(DOCNAME).qmd research.bib
	quarto render $<

	
clean:
	rm -R $(DOCNAME)_files; rm $(DOCNAME).html