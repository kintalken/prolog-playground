
:- ['./../src/suite.prolog'] .

:- begin_tests(basic) .

test('1',[])
:-
assertion(nth__oldest__child(1,john,maggie,13))
.

test('2',[])
:-
assertion(nth__oldest__child(3,john,mary,11))
.

test('3',[])
:-
assertion(nth__oldest__child(2,nancy,adrian,24))
.

:- end_tests(basic) .

