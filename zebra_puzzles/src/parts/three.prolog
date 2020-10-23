
:- module(three,[]) .

:- [library(lists)] .

:- op(1,'xfy','contains') .

puzzle(CULPRITs)
:-
induktion(CULPRITs) ,
deduktion(CULPRITs)
.

induktion(CULPRITs) :-
there_are_three_culprits(CULPRITs) ,
the_set_of_last_names_is_known(CULPRITs) ,
the_set_of_ages_is_known(CULPRITs)
.

deduktion(CULPRITs)
:-
one_is_three_years_older(CULPRITs)
.

there_are_three_culprits(CULPRITs)
:-
length(CULPRITs,3) ,
lists:nth1(1,CULPRITs,{position:1,first_name:'Angela',last_name:_,age:_}) ,
lists:nth1(2,CULPRITs,{position:2,first_name:'Mary',last_name:_,age:_}) ,
lists:nth1(3,CULPRITs,{position:3,first_name:'David',last_name:_,age:_})
.

the_set_of_last_names_is_known(CULPRITs)
:-
CULPRITs contains {position:_,first_name:_,last_name:'Diamond',age:_} ,
CULPRITs contains {position:_,first_name:_,last_name:'Grant',age:_} ,
CULPRITs contains {position:_,first_name:_,last_name:'Leung',age:_}
.

the_set_of_ages_is_known(CULPRITs)
:-
CULPRITs contains {position:_,first_name:_,last_name:_,age:5} ,
CULPRITs contains {position:_,first_name:_,last_name:_,age:7} ,
CULPRITs contains {position:_,first_name:_,last_name:_,age:8}
.

one_is_three_years_older(CULPRITs)
:-
CULPRITs contains {position:_,first_name:_,last_name:'Grant',age:AGE_GRANT} ,
CULPRITs contains {position:_,first_name:_,last_name:'Leung',age:AGE_LEUNG} ,
AGE_GRANT is AGE_LEUNG + 3
.

CULPRITs contains CULPRIT
:-
lists:member(CULPRIT,CULPRITs)
.

