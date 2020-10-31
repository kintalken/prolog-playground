
PROJECT_NAME=$(notdir $(basename $(shell pwd)))

.PHONY : all demo test clean doc src tests

all : dirs banner src test doc

dirs :
	@mkdir -p src
	@mkdir -p tests

banner :
	@echo "PROJECT_NAME=$(PROJECT_NAME)"

demo : src doc test
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

tests : $(wildcard tests/*) $(wildcard tests/suite/*) $(wildcard tests/fixtures/*)

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

###### ./src/suite.prolog
```
#include ./src/suite.prolog
```

#### tests

###### ./tests/suite.prolog
```
#include ./tests/suite.prolog
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

:- begin_tests(basic) .

:- end_tests(basic) .

endef

tests/suite.prolog :
	$(file >>tests/suite.prolog,$(WRITE_TESTS_SUITE_DEFAULT_FILE))

