
tarai__firstarg1(X,Y,Z,R)
:-
prolog:compare(C,X,Y) ,
tarai__firstarg1(C,X,Y,Z,R)
.

tarai__firstarg1('<',_,Y,_,R)
:-
R = Y
.

tarai__firstarg1('=',_,Y,_,R)
:-
R = Y
.

tarai__firstarg1('>',X,Y,Z,R)
:-
X1 is X - 1 , tarai__firstarg1(X1,Y,Z,RX) ,
Y1 is Y - 1 , tarai__firstarg1(Y1,Z,X,RY) ,
Z1 is Z - 1 , tarai__firstarg1(Z1,X,Y,RZ) ,
tarai__firstarg1(RX,RY,RZ,R)
.

