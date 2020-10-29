
%!  power(A0,B0,Q)
%
% Q is the calculation of the base A0 raised to the power B0 .

power(A0,B0,Q)
:-
power(A0,1,B0,Q)
.

power(_X0,Y0,Z0,Q)
:-
Z0 = 0 ,
Q = Y0
.

power(X0,Y0,Z0,Q)
:-
Z0 \= 0 ,
remainder(Z0,2,R) ,
quotient(Z0,2,Z) ,
rxy_determines_y(R,X0,Y0,Y) ,
x_is_squared(X0,X) ,
power(X,Y,Z,Q)
.

x_is_squared(X0,X)
:-
X is X0 * X0
.

rxy_determines_y(R,X0,Y0,Y)
:-
R = 1 ,
Y is X0 * Y0
.

rxy_determines_y(R,_X0,Y0,Y)
:-
R \= 1 ,
Y is Y0
.

remainder(A0,B0,Q)
:-
Q is mod(A0,B0)
.

quotient(A0,B0,Q)
:-
Q is floor(A0 / B0)
.

