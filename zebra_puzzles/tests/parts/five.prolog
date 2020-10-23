:- begin_tests(five) .

test('1',[ACTUAL == EXPECT])
:-
prolog:bagof(HOUSEs,five:puzzle(HOUSEs),HOUSEss) ,
ACTUAL = HOUSEss ,
EXPECT =
[
	[]
]
.

:- end_tests(five) .

