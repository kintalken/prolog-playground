
nth__oldest__child(NTH0,PERSON0,NTH_CHILD,NTH_AGE)
:-
QUERY=(child(PERSON0,CHILD) , age(CHILD,AGE)) ,
FORM=(age___child(AGE,CHILD)) ,
prolog:setof(FORM,QUERY,YOUNGEST_TO_OLDESTs) ,
lists:reverse(YOUNGEST_TO_OLDESTs,OLDEST_TO_YOUNGESTs) ,
lists:nth1(NTH0,OLDEST_TO_YOUNGESTs,age___child(NTH_AGE,NTH_CHILD))
.

/*
$ make demo

?- nth__oldest__child(1,john,CHILD,AGE) .
CHILD = maggie,
AGE = 13.

?- nth__oldest__child(2,john,CHILD,AGE).
CHILD = martinez,
AGE = 12.

?- nth__oldest__child(3,john,CHILD,AGE).
CHILD = mary,
AGE = 11.

?- nth__oldest__child(4,john,CHILD,AGE).
false.

?-
*/

