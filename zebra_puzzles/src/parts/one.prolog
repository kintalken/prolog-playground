
:- module(one,[]) .

:- [library(lists)] .

:- op(1,'xfy','contains') .

puzzle(HOUSEs)
:-
induktion(HOUSEs) ,
deduktion(HOUSEs)
.

induktion(HOUSEs)
:-
there_are_three_houses(HOUSEs) ,
the_set_of_positions_is_known(HOUSEs) ,
the_set_of_colors_is_known(HOUSEs) ,
the_set_of_nationalities_is_known(HOUSEs)
.

deduktion(HOUSEs)
:-
the_palestinian_lives_right_of_the_red_house(HOUSEs) ,
the_norwegian_lives_in_an_blue_house(HOUSEs) ,
the_italian_lives_in_position_two(HOUSEs)
.

there_are_three_houses(HOUSEs)
:-
length(HOUSEs,3)
.

the_set_of_positions_is_known(HOUSEs)
:-
lists:nth1(1,HOUSEs,{position:1,color:_,nationality:_}) ,
lists:nth1(2,HOUSEs,{position:2,color:_,nationality:_}) ,
lists:nth1(3,HOUSEs,{position:3,color:_,nationality:_})
.

the_set_of_colors_is_known(HOUSEs)
:-
HOUSEs contains {position:_,color:'blue',nationality:_} ,
HOUSEs contains {position:_,color:'red',nationality:_} ,
HOUSEs contains {position:_,color:'white',nationality:_}
.

the_set_of_nationalities_is_known(HOUSEs)
:-
HOUSEs contains {position:_,color:_,nationality:'italian'} ,
HOUSEs contains {position:_,color:_,nationality:'norwegian'} ,
HOUSEs contains {position:_,color:_,nationality:'palestinian'}
.

the_palestinian_lives_right_of_the_red_house(HOUSEs)
:-
HOUSEs contains {position:POSITION_PALESTINIAN,color:_,nationality:'palestinian'} ,
HOUSEs contains {position:POSITION_RED,color:'red',nationality:_} ,
POSITION_PALESTINIAN is POSITION_RED + 1
.

the_norwegian_lives_in_an_blue_house(HOUSEs)
:-
HOUSEs contains {position:_,color:'blue',nationality:'norwegian'}
.

the_italian_lives_in_position_two(HOUSEs)
:-
HOUSEs contains {position:2,color:_,nationality:'italian'}
.

HOUSEs contains HOUSE
:-
lists:member(HOUSE,HOUSEs)
.

