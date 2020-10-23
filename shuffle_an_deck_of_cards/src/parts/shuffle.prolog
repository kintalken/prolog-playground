
%! shuffle(Xs0,Ys) .
%
% The list `Ys` is an random permutation of the list `Xs0` .
% No assumption is made about the nature of each item in the list .
%
% The default seed for randomness provided by the system is truly random .
% Set the seed explicitly with `system:set_random(seed(SEED))` . 

:- op(1,'xfy','shuffle_') .

shuffle(Xs0,Ys)
:-
[assign_randomness] shuffle_ (Xs0,Ys0) ,
[sort] shuffle_ (Ys0,Ys1) ,
[remove_randomness] shuffle_ (Ys1,Ys)
.

/*
1. assign an random number to each of the items in the list .
2. sort the list of items according to the random number assigned to each item .
3. remove the random number from each of the items in the list .
*/

[assign_randomness] shuffle_ ([],[]) .

[assign_randomness] shuffle_ ([X0|Xs0],[sortable(R,X0)|Rs])
:-
system:random(R) ,
[assign_randomness] shuffle_ (Xs0,Rs)
.

[sort] shuffle_ (Rs0,Ss)
:-
prolog:sort(Rs0,Ss)
.

[remove_randomness] shuffle_ ([],[]) .

[remove_randomness] shuffle_ ([sortable(_R0,X0)|Ss0],[X0|Xs])
:-
[remove_randomness] shuffle_ (Ss0,Xs)
.

/*

?- cards(CARDs0) , shuffle(CARDs0,CARDs) .
CARDs0 = [2♣,2♦,2♠,2♥,3♣,3♦,3♠,3♥,4♣,4♦,4♠,4♥,5♣,5♦,5♠,5♥,6♣,6♦,6♠,6♥,7♣,7♦,7♠,7♥,8♣,8♦,8♠,8♥,9♣,9♦,9♠,9♥,10♣,10♦,10♠,10♥,J♣,J♦,J♠,J♥,Q♣,Q♦,Q♠,Q♥,K♣,K♦,K♠,K♥,A♣,A♦,A♠,A♥] ,
CARDs = [10♣,5♠,3♠,A♥,A♠,7♠,10♥,4♠,A♣,2♥,8♠,4♦,5♣,2♦,5♥,9♥,Q♦,3♣,J♠,4♣,6♥,A♦,9♣,Q♥,K♠,8♣,Q♣,K♦,4♥,7♣,5♦,3♥,3♦,8♦,7♦,K♥,9♦,10♠,6♣,8♥,10♦,J♦,7♥,6♦,J♥,9♠,2♣,6♠,2♠,Q♠,K♣,J♣] ;
false .

?- cards(CARDs0) , shuffle(CARDs0,CARDs).
CARDs0 = [2♣,2♦,2♠,2♥,3♣,3♦,3♠,3♥,4♣,4♦,4♠,4♥,5♣,5♦,5♠,5♥,6♣,6♦,6♠,6♥,7♣,7♦,7♠,7♥,8♣,8♦,8♠,8♥,9♣,9♦,9♠,9♥,10♣,10♦,10♠,10♥,J♣,J♦,J♠,J♥,Q♣,Q♦,Q♠,Q♥,K♣,K♦,K♠,K♥,A♣,A♦,A♠,A♥] ,
CARDs = [J♣,3♣,2♥,Q♥,9♣,6♥,8♥,J♠,J♦,10♣,5♠,6♦,5♦,9♠,7♦,10♦,A♣,K♠,Q♠,7♣,8♦,9♦,K♣,2♠,J♥,K♦,A♥,5♥,A♠,K♥,Q♣,4♦,9♥,10♠,4♠,A♦,4♣,2♣,Q♦,5♣,3♠,6♠,3♥,7♠,7♥,8♠,2♦,10♥,4♥,3♦,6♣,8♣] ;
false .

?- cards(CARDs0) , shuffle(CARDs0,CARDs).
CARDs0 = [2♣,2♦,2♠,2♥,3♣,3♦,3♠,3♥,4♣,4♦,4♠,4♥,5♣,5♦,5♠,5♥,6♣,6♦,6♠,6♥,7♣,7♦,7♠,7♥,8♣,8♦,8♠,8♥,9♣,9♦,9♠,9♥,10♣,10♦,10♠,10♥,J♣,J♦,J♠,J♥,Q♣,Q♦,Q♠,Q♥,K♣,K♦,K♠,K♥,A♣,A♦,A♠,A♥] ,
CARDs = [3♦,8♣,A♠,Q♥,9♦,8♦,K♠,3♣,2♥,7♥,2♦,5♦,10♦,7♦,J♣,2♣,9♠,3♠,Q♦,7♠,6♠,4♣,4♠,8♥,5♠,K♦,10♥,J♦,J♠,6♦,10♠,4♦,A♥,K♣,Q♠,2♠,A♣,J♥,5♣,5♥,A♦,3♥,Q♣,7♣,K♥,8♠,9♥,10♣,4♥,6♣,9♣,6♥] ;
false .

*/
