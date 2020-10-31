
:- module(b,[]) .

:- op(1,'xfy','gcd_') .

gcd(M0,N0,Q)
:-
(function) gcd_ (M0,N0,Q)
.

(function) gcd_ (M0,N0,Q)
:-
R is mod(M0,N0) ,
(remainder) gcd_ (M0,N0,Q,R)
.

(remainder) gcd_ (_M0,N0,Q,R0)
:-
R0 =:= 0 ,
! ,
Q is N0
.

(remainder) gcd_ (_M0,N0,Q,R0)
:-
R0 =\= 0 ,
! ,
M is N0 ,
N is R0 ,
(function) gcd_ (M,N,Q)
.

