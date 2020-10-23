%! card(NAME)

card(NAME)
:-
card(NAME,_,_)
.

%! card(NAME,RANK,SUIT)

card(NAME,RANK,SUIT)
:-
rank(RANK) ,
suit(SUIT) ,
prolog:atom_concat(RANK,SUIT,NAME)
.

/*
?- card(CARD) .
CARD = '2♣' ;
CARD = '2♦' ;
CARD = '2♠' ;
CARD = '2♥' ;
CARD = '3♣' ;
CARD = '3♦' ;
CARD = '3♠' ;
CARD = '3♥' ;
CARD = '4♣' ;
CARD = '4♦' ;
CARD = '4♠' ;
CARD = '4♥' ;
CARD = '5♣' ;
CARD = '5♦' ;
CARD = '5♠' ;
CARD = '5♥' ;
CARD = '6♣' ;
CARD = '6♦' ;
CARD = '6♠' ;
CARD = '6♥' ;
CARD = '7♣' ;
CARD = '7♦' ;
CARD = '7♠' ;
CARD = '7♥' ;
CARD = '8♣' ;
CARD = '8♦' ;
CARD = '8♠' ;
CARD = '8♥' ;
CARD = '9♣' ;
CARD = '9♦' ;
CARD = '9♠' ;
CARD = '9♥' ;
CARD = '10♣' ;
CARD = '10♦' ;
CARD = '10♠' ;
CARD = '10♥' ;
CARD = 'J♣' ;
CARD = 'J♦' ;
CARD = 'J♠' ;
CARD = 'J♥' ;
CARD = 'Q♣' ;
CARD = 'Q♦' ;
CARD = 'Q♠' ;
CARD = 'Q♥' ;
CARD = 'K♣' ;
CARD = 'K♦' ;
CARD = 'K♠' ;
CARD = 'K♥' ;
CARD = 'A♣' ;
CARD = 'A♦' ;
CARD = 'A♠' ;
CARD = 'A♥' .
*/
