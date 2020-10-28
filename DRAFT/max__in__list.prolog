
/*
the maximum element in the list is the element with
no list member greater than it .
*/

list__has__max(LISTs,MAX)
:-
member(MAX,LISTs) ,
\+ (member(OTHER,LISTs) , OTHER > MAX)
.

