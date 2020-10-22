
tarai__cutless(X,Y,_,R)
:-
X < Y ,
%! ,
R = Y
.

tarai__cutless(X,Y,_,R)
:-
X = Y ,
%! ,
R = Y
.

tarai__cutless(X,Y,Z,R)
:-
X > Y ,
%! ,
X1 is X - 1 , tarai__cut(X1,Y,Z,RX) ,
Y1 is Y - 1 , tarai__cut(Y1,Z,X,RY) ,
Z1 is Z - 1 , tarai__cut(Z1,X,Y,RZ) ,
tarai__cutless(RX,RY,RZ,R) .
