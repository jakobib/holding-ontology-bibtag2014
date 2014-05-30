SLIDES_OPTS  = --template vzg-slides.tex
SLIDES_OPTS += --slide-level 2 -t beamer -V documentclass=beamer

slides.pdf: slides.md vzg-slides.tex
	ppp $< | pandoc -s -S $(SLIDES_OPTS) -o $@
