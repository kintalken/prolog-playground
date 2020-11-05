
PROJECT_NAME=$(notdir $(basename $(shell pwd)))

.PHONY : all demo test clean doc src tests

all : dirs banner src doc test

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

tests : tests/suite.prolog tests/suite/basic.prolog

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

#### demo

###### ./src/suite/main.prolog.1.demo
```
#include ./src/suite/main.prolog.1.demo
```

#### source

###### ./src/suite/main.prolog
```
#include ./src/suite/main.prolog
```

#### tests

###### ./tests/suite/basic.prolog
```
#include ./tests/suite/basic.prolog
```

## appendix

### authorship

* (c) kintalken@gmail.com $(DATE) .

endef

README.adoc.in :
	$(file >>README.adoc.in,$(WRITE_README_DEFAULT_FILE))

define WRITE_SRC_SUITE_DEFAULT_FILE

:- ['./suite/main.prolog'] .

endef

src/suite.prolog :
	$(file >>src/suite.prolog,$(WRITE_SRC_SUITE_DEFAULT_FILE))

define WRITE_TESTS_SUITE_DEFAULT_FILE

:- ['./../src/suite.prolog'] .

:- ['./suite/basic.prolog'] .

endef

tests/suite.prolog :
	$(file >>tests/suite.prolog,$(WRITE_TESTS_SUITE_DEFAULT_FILE))

define WRITE_TESTS_SUITE_BASIC_DEFAULT_FILE

:- begin_tests(basic)

:- end_tests(basic)

endef

tests/suite/basic.prolog :
	$(file >>tests/suite/basic.prolog,$(WRITE_TESTS_SUITE_BASIC_DEFAULT_FILE))

