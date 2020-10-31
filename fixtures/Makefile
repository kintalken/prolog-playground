
PROJECT_NAME=$(notdir $(basename $(shell pwd)))

.PHONY : all demo test clean doc src tests

all : dirs banner src test doc

dirs :
	@mkdir -p src
	@mkdir -p src/suite
	@mkdir -p tests
	@mkdir -p tests/suite

banner :
	@echo "PROJECT_NAME=$(PROJECT_NAME)"

demo : src doc
	swipl -q -l src/suite.prolog

test : tests
	swipl -l tests/suite.prolog -g 'run_tests,halt'

clean :
	@rm -f README.html
	@rm -f README.adoc

doc : README.adoc.in README.html

README.adoc : src tests

src : src/suite.prolog 

src : Makefile

src : $(wildcard src/*) $(wildcard src/suite/*)

tests : tests/suite.prolog

tests : $(wildcard tests/*) $(wildcard tests/fixtures/*) $(wildcard tests/suite/*)

%.adoc : %.adoc.in
	gpp -x $< > $@

.PRECIOUS : %.adoc

%.html : %.adoc
	asciidoctor -q $< > $@

%.pdf : %.tex
	pdflatex -output-directory=$(dir $<) $<
	rm $(basename $<).aux
	rm $(basename $<).log

%.pdf.crop : %.pdf 
	pdfcrop $< $@

%.png : %.pdf.crop
	gs -q -sDEVICE=pngalpha -o $@ -r600 $<

DATE=$(shell date +%F)

define WRITE_MAKEFILE_DEFAULT_FILE

include ../fixtures/Makefile

endef

Makefile :
	$(file >>Makefile,$(WRITE_MAKEFILE_DEFAULT_FILE))

define WRITE_README_DEFAULT_FILE

# $(PROJECT_NAME)
:toc:
:toclevels: 6

## $(PROJECT_NAME)

### question

### answer

###### ./src/suite/suite.prolog
```
#include ./src/suite/suite.prolog
```

#### tests

###### ./tests/suite/suite.prolog
```
#include ./tests/suite/suite.prolog
```

## appendix

### authorship

* (c) kintalken@gmail.com $(DATE) .

endef

README.adoc.in :
	$(file >>README.adoc.in,$(WRITE_README_DEFAULT_FILE))

define WRITE_SRC_SUITE_DEFAULT_FILE

:- ['./suite/$(PROJECT_NAME).prolog'] .

endef

src/suite.prolog :
	$(file >>src/suite.prolog,$(WRITE_SRC_SUITE_DEFAULT_FILE))

define WRITE_TESTS_SUITE_DEFAULT_FILE

:- ['./../src/suite.prolog'] .

endef

tests/suite.prolog :
	$(file >>tests/suite.prolog,$(WRITE_TESTS_SUITE_DEFAULT_FILE))

