
tarai__firstarg2(X,Y,Z,R)
:-
prolog:compare(C,X,Y) ,
tarai__firstarg2(C,X,Y,Z,R)
.

tarai__firstarg2('<',_,Y,_,R)
:-
R = Y
.

tarai__firstarg2('=',_,Y,_,R)
:-
R = Y
.

tarai__firstarg2('>',X,Y,Z,R)
:-
X1 is X - 1 , tarai__firstarg2(X1,Y,Z,RX) ,
Y1 is Y - 1 , tarai__firstarg2(Y1,Z,X,RY) ,
Z1 is Z - 1 , tarai__firstarg2(Z1,X,Y,RZ) ,
prolog:compare(C4,RX,RY) , tarai__firstarg2(C4,RX,RY,RZ,R)
.

