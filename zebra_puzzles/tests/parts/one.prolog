
:- begin_tests(one) .

test('1',[ACTUAL == EXPECT])
:-
prolog:bagof(HOUSEs,one:puzzle(HOUSEs),HOUSEss) ,
ACTUAL = HOUSEss ,
EXPECT =
[
	[{position:1,color:blue,nationality:norwegian},{position:2,color:red,nationality:italian},{position:3,color:white,nationality:palestinian}]
]
.

:- end_tests(one) .

