
gcd__a(M0,N0,Q)
:-
R is mod(M0,N0) ,
(
	R = 0 ->
	Q = N0 ;
	M = N0 ,
	N = R ,
	gcd__a(M,N,Q)
)
.

