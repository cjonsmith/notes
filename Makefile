srcfiles := $(filter-out ./README.md, $(shell find . -name "*.md"))
outfiles := $(shell find . -name "*.html")

notes: $(srcfiles)
	for file in $(srcfiles) ; do \
		echo "[$${file}]($${file%.*}.html)" >> index.md ; \
		echo "" >> index.md ; \
		pandoc -o "$${file%.*}.html" $$file ; \
	done
	pandoc -o index.html index.md ;

clean: $(outfiles)
	rm -f $(outfiles)
	rm -f index.*
