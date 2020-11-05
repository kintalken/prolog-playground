
:- begin_tests(list_without_middle) .

test('1',[])
:-
list_without_middle([a,b,c],[a,c])
.

test('2',[fail])
:-
list_without_middle([a,c],_)
.

test('3',[])
:-
list_without_middle([a,b,c,d,e],[a,b,d,e])
.

test('4',[fail])
:-
list_without_middle([],_)
.

test('5',[])
:-
list_without_middle([a],[])
.

:- end_tests(list_without_middle) .

