:- [library(lists)] .

:- dynamic data:distance/3 .

:- dynamic data:vertex/3 .
:- dynamic data:edge/4 .
:- dynamic data:predecessor/4 .

data:distance('demo1','A','C',3) .
data:distance('demo1','A','D',5) .
data:distance('demo1','B','C',7) .
data:distance('demo1','B','D',9) .

/*
?- calculate('demo1') .
true .

?- path('demo1','A','A',PATHs) .
PATHs = [segment('A', 0)] .

?- path('demo1','A','B',PATHs) .
PATHs = [segment('A', 0), segment('C', 3), segment('B', 10)] .

?- path('demo1','A','C',PATHs) .
PATHs = [segment('A', 0), segment('C', 3)] .

?- path('demo1','A','D',PATHs) .
PATHs = [segment('A', 0), segment('D', 5)] .

?- 
*/

data:distance('demo2','A','B',3) .
data:distance('demo2','B','C',5) .
data:distance('demo2','C','D',7) .
data:distance('demo2','D','E',11) .
data:distance('demo2','E','E',0) .

/*
?- calculate('demo2') .
true .

?- path('demo2','A','A',PATHs) .
PATHs = [segment('A', 0)] .

?- path('demo2','A','B',PATHs) .
PATHs = [segment('A', 0), segment('B', 3)] .

?- path('demo2','A','C',PATHs) .
PATHs = [segment('A', 0), segment('B', 3), segment('C', 8)] .

?- path('demo2','A','D',PATHs) .
PATHs = [segment('A', 0), segment('B', 3), segment('C', 8), segment('D', 15)] .

?- path('demo2','A','E',PATHs) .
PATHs = [segment('A', 0), segment('B', 3), segment('C', 8), segment('D', 15), segment('E', 26)] .

?- 
*/

calculate(Q0)
:-
prolog:forall(location(Q0,START),calculate(Q0,START))
.

calculate(Q0,START0)
:-
create__initial__vertexes(Q0,START0) ,
create__initial__edges(Q0,START0) ,
create__initial__predecessors(Q0,START0) ,
loop(Q0,START0) .

debug
:-
listing(data:vertex) ,
listing(data:edge) ,
listing(data:predecessor)
.

location(Q0,LOCATION)
:-
lookup(data:distance(Q0,LOCATION,_,_)) ;
lookup(data:distance(Q0,_,LOCATION,_))
.

neighbour(Q0,LOCATION_1,LOCATION_2,DISTANCE)
:-
lookup(data:distance(Q0,LOCATION_1,LOCATION_2,DISTANCE)) ;
lookup(data:distance(Q0,LOCATION_2,LOCATION_1,DISTANCE))
.

create__initial__vertexes(Q0,START0)
:-
location(Q0,LOCATION) ,
\+ lookup(data:vertex(Q0,START0,LOCATION)) ,
remember(data:vertex(Q0,START0,LOCATION)) ,
fail ;
true
.

create__initial__edges(Q0,START0)
:-
lookup(data:vertex(Q0,START0,VERTEX)) ,
(START0 = VERTEX -> DISTANCE is 0 ; DISTANCE is inf) ,
\+ lookup(data:edge(Q0,START0,VERTEX,DISTANCE)) ,
remember(data:edge(Q0,START0,VERTEX,DISTANCE)) ,
fail ;
true
.


create__initial__predecessors(Q0,START0)
:-
lookup(data:vertex(Q0,START0,VERTEX)) ,
\+ lookup(data:predecessor(Q0,START0,VERTEX,_)) ,
remember(data:predecessor(Q0,START0,VERTEX,_)) ,
fail ;
true
.

loop(Q0,START0)
:-
repeat ,
current__vertex(Q0,START0,CURRENT,DISTANCE_FROM_START) ,
forget(data:vertex(Q0,START0,CURRENT)) ,
neighbour(Q0,CURRENT,NEIGHBOUR,DISTANCE_FROM_NEIGHBOUR) ,
lookup(data:edge(Q0,START0,NEIGHBOUR,EXISTING_DISTANCE)) ,
POTENTIAL_DISTANCE is DISTANCE_FROM_START + DISTANCE_FROM_NEIGHBOUR ,
maybe__update__neighbour(Q0,START0,CURRENT,NEIGHBOUR,EXISTING_DISTANCE,POTENTIAL_DISTANCE) ,
\+ lookup(data:vertex(Q0,_,_)) , % repeat until no more vertex .
!
.

current__vertex(Q0,START0,CURRENT,DISTANCE_FROM_START)
:- % there is an edge for which no other edge has an lessor distance
lookup(data:vertex(Q0,START0,CURRENT)) ,
lookup(data:edge(Q0,START0,CURRENT,DISTANCE_FROM_START)) ,
\+
(
	lookup(data:vertex(Q0,START0,OTHER)) ,
	lookup(data:edge(Q0,START0,OTHER,DISTANCE_COMPARE)) , 
	DISTANCE_COMPARE < DISTANCE_FROM_START
) ,
!  % only one current vertex at an time .
.

maybe__update__neighbour(Q0,START0,CURRENT0,NEIGHBOUR0,EXISTING_DISTANCE0,POTENTIAL_DISTANCE0)
:-
POTENTIAL_DISTANCE0 < EXISTING_DISTANCE0 ->
forget(data:edge(Q0,START0,NEIGHBOUR0,_)) ,
remember(data:edge(Q0,START0,NEIGHBOUR0,POTENTIAL_DISTANCE0)) ,
forget(data:predecessor(Q0,START0,NEIGHBOUR0,_)) ,
remember(data:predecessor(Q0,START0,NEIGHBOUR0,CURRENT0)) ;
true
.

path(Q0,START0,TARGET0,PATHs)
:-
path__of__predecessors(Q0,START0,TARGET0,REVERSE_PATHs) ,
! ,
lists:reverse(REVERSE_PATHs,PATHs)
.

path__of__predecessors(Q0,START0,TARGET0,PATHs)
:-
START0 = TARGET0 ->
PATHs = [segment(TARGET0,0)] ;
lookup(data:predecessor(Q0,START0,TARGET0,PREDECESSOR)) ,
lookup(data:edge(Q0,START0,TARGET0,DISTANCE)) ,
PATHs = [segment(TARGET0,DISTANCE)|PATHs0] ,
path__of__predecessors(Q0,START0,PREDECESSOR,PATHs0)
.

remember(TERM)
:-
prolog:asserta(TERM)
.

forget(TERM)
:-
prolog:retractall(TERM)
.

lookup(TERM)
:-
prolog:call(TERM)
.
