
tarai__firstarg3(X,Y,Z,R)
:-
prolog:compare(C,X,Y) ,
tarai__firstarg3(C,X,Y,Z,R)
.

tarai__firstarg3('<',_,Y,_,R)
:-
R = Y
.

tarai__firstarg3('=',_,Y,_,R)
:-
R = Y
.

tarai__firstarg3('>',X,Y,Z,R)
:-
X1 is X - 1 , prolog:compare(C1,X1,Y) , tarai__firstarg3(C1,X1,Y,Z,RX) ,
Y1 is Y - 1 , prolog:compare(C2,Y1,Z) , tarai__firstarg3(C2,Y1,Z,X,RY) ,
Z1 is Z - 1 , prolog:compare(C3,Z1,X) , tarai__firstarg3(C3,Z1,X,Y,RZ) ,
prolog:compare(C4,RX,RY) , tarai__firstarg3(C4,RX,RY,RZ,R)
.

