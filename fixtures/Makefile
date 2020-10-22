
PROJECT_NAME=$(notdir $(basename $(shell pwd)))

.PHONY : all demo test clean doc src tests

all : dirs banner src test doc

dirs :
	@mkdir -p src
	@mkdir -p src/parts
	@mkdir -p tests
	@mkdir -p tests/parts

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

src : src/suite.prolog 

src : Makefile

src : $(wildcard src/*) $(wildcard src/parts/*)

tests : tests/suite.prolog

tests : $(wildcard tests/*) $(wildcard tests/fixtures/*) $(wildcard tests/parts/*)

%.adoc : %.adoc.in
	gpp -x $< > $@

.PRECIOUS : %.adoc

%.html : %.adoc
	asciidoctor -q -a toc -a toclevels=6 $< > $@

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

###### ./src/parts/$(PROJECT_NAME).prolog
```
#include ./src/parts/$(PROJECT_NAME).prolog

$(PROJECT_NAME)
:-
prolog:throw(fixme)
.

```

#### tests

###### ./tests/parts/$(PROJECT_NAME).prolog
```
#include ./tests/parts/$(PROJECT_NAME).prolog

:- begin_tests($(PROJECT_NAME)) .

test('1',[fixme(todo)])
:-
false
.

```

## appendix

### authorship

* (c) kintalken@gmail.com $(DATE) .

endef

README.adoc.in :
	$(file >>README.adoc.in,$(WRITE_README_DEFAULT_FILE))

define WRITE_SRC_SUITE_DEFAULT_FILE

:- ['./parts/$(PROJECT_NAME).prolog'] .

endef

src/suite.prolog :
	$(file >>src/suite.prolog,$(WRITE_SRC_SUITE_DEFAULT_FILE))

define WRITE_TESTS_SUITE_DEFAULT_FILE

:- ['./../src/suite.prolog'] .

:- ['./parts/$(PROJECT_NAME).prolog'] .

endef

tests/suite.prolog :
	$(file >>tests/suite.prolog,$(WRITE_TESTS_SUITE_DEFAULT_FILE))

