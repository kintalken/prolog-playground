

:- module(four,[]) .

:- [library(lists)] .

:- op(1,'xfy','contains') .

puzzle(CULPRITs)
:-
induktion(CULPRITs) ,
deduktion(CULPRITs)
.

induktion(CULPRITs)
:-
CULPRITs = [] % todo .
.

deduktion(CULPRITs)
:-
CULPRITs = [] % todo .
.

CULPRITs contains CULPRIT
:-
lists:member(CULPRIT,CULPRITs)
.

