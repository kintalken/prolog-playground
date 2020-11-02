
data:distance('demo_1','A','C',3) .
data:distance('demo_1','A','D',5) .
data:distance('demo_1','B','C',7) .
data:distance('demo_1','B','D',9) .

/*
?- calculate('demo_1') .
true .

?- path('demo_1','A','A',PATHs) .
PATHs = [segment('A', 0)] .

?- path('demo_1','A','B',PATHs) .
PATHs = [segment('A', 0), segment('C', 3), segment('B', 10)] .

?- path('demo_1','A','C',PATHs) .
PATHs = [segment('A', 0), segment('C', 3)] .

?- path('demo_1','A','D',PATHs) .
PATHs = [segment('A', 0), segment('D', 5)] .

?- 
*/

data:distance('demo_2','A','B',3) .
data:distance('demo_2','B','C',5) .
data:distance('demo_2','C','D',7) .
data:distance('demo_2','D','E',11) .
data:distance('demo_2','E','E',0) .

/*
?- calculate('demo_2') .
true .

?- path('demo_2','A','A',PATHs) .
PATHs = [segment('A', 0)] .

?- path('demo_2','A','B',PATHs) .
PATHs = [segment('A', 0), segment('B', 3)] .

?- path('demo_2','A','C',PATHs) .
PATHs = [segment('A', 0), segment('B', 3), segment('C', 8)] .

?- path('demo_2','A','D',PATHs) .
PATHs = [segment('A', 0), segment('B', 3), segment('C', 8), segment('D', 15)] .

?- path('demo_2','A','E',PATHs) .
PATHs = [segment('A', 0), segment('B', 3), segment('C', 8), segment('D', 15), segment('E', 26)] .

?- 
*/

