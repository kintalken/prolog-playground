
:- [library(csv)] .
:- [library(lists)] .

%! distance(CITY_A,CITY_B,DISTANCE)
%
% dynamic facts asserted based upon csv file .

:- dynamic distance/3 .

:- op(1,'xfy','csv_') .


%! csv(FILE0)
%
% read the CSV file `FILE0` and add facts to the database .

csv(FILE0)
:-
(start) csv_ (FILE0)
.

(start) csv_ (FILE0)
:-
csv:csv_read_file(FILE0,[HEADER|ROWss]) ,
row__to__list(HEADER,HEADERs) ,
(loop) csv_ (HEADERs,ROWss) 
.

(loop) csv_ (_HEADERs,[]) 
:-
true
.

(loop) csv_ (HEADERs,[ROW|ROWss]) 
:-
row__to__list(ROW,ROWs) ,
lists:nth1(1,ROWs,CITY_A) ,
QUERY_A=(lists:nth1(NTH,ROWs,DISTANCE)) ,
QUERY_B=(NTH > 1) ,
QUERY_C=(lists:nth1(NTH,HEADERs,CITY_B)) ,
QUERY=(QUERY_A,QUERY_B,QUERY_C) ,
ASSERT=assertz(distance(CITY_A,CITY_B,DISTANCE)) ,
forall(QUERY,ASSERT) ,
(loop) csv_ (HEADERs,ROWss) 
.

row__to__list(ROW,ROWs)
:-
ROW=..[_|ROWs]
.

/*
?- csv('data/distances.csv').
true ;
false.

?- listing(distance).

distance('A', 'E', 3).
distance('A', 'G', 5).
distance('A', 'C', 7).
distance('A', 'B', 3).
distance('B', 'E', 4).
distance('B', 'G', 5).
distance('B', 'C', 6).
distance('B', 'B', 0).
distance('C', 'E', 4).
distance('C', 'G', 1).
distance('C', 'C', 0).
distance('C', 'B', 6).
distance('D', 'E', 5).
distance('D', 'G', 8).
distance('D', 'C', 3).
distance('D', 'B', 6).

?-
*/
