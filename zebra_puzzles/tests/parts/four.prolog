:- begin_tests(four) .

test('1',[ACTUAL == EXPECT])
:-
prolog:bagof(HOUSEs,four:puzzle(HOUSEs),HOUSEss) ,
ACTUAL = HOUSEss ,
EXPECT =
[
	[]
]
.

:- end_tests(four) .

