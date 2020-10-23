:- begin_tests(three) .

test('1',[ACTUAL == EXPECT])
:-
prolog:bagof(HOUSEs,three:puzzle(HOUSEs),HOUSEss) ,
ACTUAL = HOUSEss ,
EXPECT =
[
	[{position:1,first_name:'Angela',last_name:'Diamond',age:7},{position:2,first_name:'Mary',last_name:'Grant',age:8},{position:3,first_name:'David',last_name:'Leung',age:5}] ,
	[{position:1,first_name:'Angela',last_name:'Diamond',age:7},{position:2,first_name:'Mary',last_name:'Leung',age:5},{position:3,first_name:'David',last_name:'Grant',age:8}] ,
	[{position:1,first_name:'Angela',last_name:'Grant',age:8},{position:2,first_name:'Mary',last_name:'Diamond',age:7},{position:3,first_name:'David',last_name:'Leung',age:5}] ,
	[{position:1,first_name:'Angela',last_name:'Leung',age:5},{position:2,first_name:'Mary',last_name:'Diamond',age:7},{position:3,first_name:'David',last_name:'Grant',age:8}] ,
	[{position:1,first_name:'Angela',last_name:'Grant',age:8},{position:2,first_name:'Mary',last_name:'Leung',age:5},{position:3,first_name:'David',last_name:'Diamond',age:7}] ,
	[{position:1,first_name:'Angela',last_name:'Leung',age:5},{position:2,first_name:'Mary',last_name:'Grant',age:8},{position:3,first_name:'David',last_name:'Diamond',age:7}]
]
.

:- end_tests(three) .

