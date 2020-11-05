
:- begin_tests(list_middle) .

test('1',[])
:-
list_middle([a,b,c],b)
.

test('2',[])
:-
list_middle([a,b,c],b,[a],[c])
.

test('3',[fail])
:-
list_middle([a,c],_,_,_)
.

test('4',[])
:-
list_middle([a,b,c,d,e],c,[a,b],[d,e])
.

test('5',[fail])
:-
list_middle([],_,_,_)
.

test('6',[])
:-
list_middle([a],a,[],[])
.

:- end_tests(list_middle) .
