
:- begin_tests(two) .

test('1',[ACTUAL == EXPECT])
:-
prolog:bagof(HOUSEs,two:puzzle(HOUSEs),HOUSEss) ,
ACTUAL = HOUSEss ,
EXPECT = 
[
	[{position:1, color:blue, nationality:brazilian, pet:fish, sport:soccer}, {position:2, color:green, nationality:german, pet:cat, sport:lacrosse}, {position:3, color:red, nationality:chinese, pet:dog, sport:basketball}] ,
	[{position:1, color:blue, nationality:brazilian, pet:fish, sport:soccer}, {position:2, color:green, nationality:chinese, pet:cat, sport:lacrosse}, {position:3, color:red, nationality:german, pet:dog, sport:basketball}] ,
	[{position:1, color:blue, nationality:german, pet:fish, sport:soccer}, {position:2, color:green, nationality:chinese, pet:cat, sport:lacrosse}, {position:3, color:red, nationality:brazilian, pet:dog, sport:basketball}] ,
	[{position:1, color:blue, nationality:chinese, pet:fish, sport:soccer}, {position:2, color:green, nationality:german, pet:cat, sport:lacrosse}, {position:3, color:red, nationality:brazilian, pet:dog, sport:basketball}]
]
.

:- end_tests(two) .


