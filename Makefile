srcfiles := $(filter-out ./README.md, $(shell find . -name "*.md"))
outfiles := $(shell find . -name "*.html")

notes: $(srcfiles)
	for file in $(srcfiles) ; do \
		pandoc -o "$${file%.*}.html" $$file ; \
	done

clean: $(outfiles)
	rm -f $(outfiles)
