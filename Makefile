samuel.pdf: samuel.tex
	latexmk -pdf $<


.PHONY: clean
clean:
	latexmk -C

VER:=$(shell git rev-parse HEAD)

.PHONY: publish
publish: samuel.pdf
	mv samuel.pdf samuel-new.pdf
	git checkout gh-pages
	mv samuel-new.pdf samuel.pdf
	git add samuel.pdf
	git commit -m "$(VER)"
