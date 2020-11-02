
:- [library(csv)] .
:- [library(lists)] .

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
(loop) csv_ (FILE0,HEADERs,ROWss) 
.

(loop) csv_ (_FILE0,_HEADERs,[]) 
:-
true
.

(loop) csv_ (FILE,HEADERs,[ROW|ROWss]) 
:-
row__to__list(ROW,ROWs) ,
lists:nth1(1,ROWs,LOCATION_A) ,
QUERY_A=(lists:nth1(NTH,ROWs,DISTANCE)) ,
QUERY_B=(NTH > 1) ,
QUERY_C=(lists:nth1(NTH,HEADERs,LOCATION_B)) ,
QUERY=(QUERY_A,QUERY_B,QUERY_C) ,
ASSERT=(prolog:number(DISTANCE) -> remember(data:distance(FILE,LOCATION_A,LOCATION_B,DISTANCE)) ; true) ,
forall(QUERY,ASSERT) ,
(loop) csv_ (FILE,HEADERs,ROWss) 
.

row__to__list(ROW,ROWs)
:-
ROW=..[_|ROWs]
.

