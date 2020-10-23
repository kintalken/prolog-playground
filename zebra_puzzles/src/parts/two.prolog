
:- module(two,[]) .


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
the_set_of_nationalities_is_known(HOUSEs) ,
the_set_of_pets_is_known(HOUSEs) ,
the_set_of_sports_is_known(HOUSEs)
.


deduktion(HOUSEs)
:-
the_brazilian_is_not_at_position_two(HOUSEs) ,
the_occupant_with_the_pet_dog_plays_sport_basketball(HOUSEs) ,
the_occupant_at_position_two_plays_lacrosse(HOUSEs) ,
the_occupant_with_pet_fish_lives_left_of_occupant_with_pet_cat(HOUSEs) ,
the_occupant_with_pet_dog_lives_right_of_green_house(HOUSEs) ,
the_red_house_is_not_beside_the_blue_house(HOUSEs) ,
the_pet_fish_is_not_in_the_red_house(HOUSEs)
.


there_are_three_houses(HOUSEs)
:-
length(HOUSEs,3)
.


the_set_of_positions_is_known(HOUSEs)
:-
lists:nth1(1,HOUSEs,{position:1,color:_,nationality:_,pet:_,sport:_}) ,
lists:nth1(2,HOUSEs,{position:2,color:_,nationality:_,pet:_,sport:_}) ,
lists:nth1(3,HOUSEs,{position:3,color:_,nationality:_,pet:_,sport:_})
.


the_set_of_colors_is_known(HOUSEs)
:-
HOUSEs contains {position:_,color:'blue',nationality:_,pet:_,sport:_} ,
HOUSEs contains {position:_,color:'green',nationality:_,pet:_,sport:_} ,
HOUSEs contains {position:_,color:'red',nationality:_,pet:_,sport:_}
.


the_set_of_nationalities_is_known(HOUSEs)
:-
HOUSEs contains {position:_,color:_,nationality:'brazilian',pet:_,sport:_} ,
HOUSEs contains {position:_,color:_,nationality:'german',pet:_,sport:_} ,
HOUSEs contains {position:_,color:_,nationality:'chinese',pet:_,sport:_}
.


the_set_of_pets_is_known(HOUSEs)
:-
HOUSEs contains {position:_,color:_,nationality:_,pet:'dog',sport:_} ,
HOUSEs contains {position:_,color:_,nationality:_,pet:'fish',sport:_} ,
HOUSEs contains {position:_,color:_,nationality:_,pet:'cat',sport:_}
.


the_set_of_sports_is_known(HOUSEs)
:-
HOUSEs contains {position:_,color:_,nationality:_,pet:_,sport:'basketball'} ,
HOUSEs contains {position:_,color:_,nationality:_,pet:_,sport:'soccer'} ,
HOUSEs contains {position:_,color:_,nationality:_,pet:_,sport:'lacrosse'}
.


the_brazilian_is_not_at_position_two(HOUSEs)
:-
\+ HOUSEs contains {position:2,color:_,nationality:'brazilian',pet:_,sport:_}
.


the_occupant_with_the_pet_dog_plays_sport_basketball(HOUSEs)
:-
HOUSEs contains {position:_,color:_,nationality:_,pet:'dog',sport:'basketball'}
.


the_occupant_at_position_two_plays_lacrosse(HOUSEs)
:-
HOUSEs contains {position:2,color:_,nationality:_,pet:_,sport:'lacrosse'}
.


the_occupant_with_pet_fish_lives_left_of_occupant_with_pet_cat(HOUSEs)
:-
HOUSEs contains {position:POSITION_FISH,color:_,nationality:_,pet:'fish',sport:_} ,
HOUSEs contains {position:POSITION_CAT,color:_,nationality:_,pet:'cat',sport:_} ,
POSITION_FISH is POSITION_CAT - 1
.


the_occupant_with_pet_dog_lives_right_of_green_house(HOUSEs)
:-
HOUSEs contains {position:POSITION_DOG,color:_,nationality:_,pet:'dog',sport:_} ,
HOUSEs contains {position:POSITION_GREEN,color:'green',nationality:_,pet:_,sport:_} ,
POSITION_DOG is POSITION_GREEN + 1
.


the_occupant_in_position_three_has_nationality_german(HOUSEs)
:-
HOUSEs contains {position:3,color:_,nationality:'german',pet:_,sport:_}
.

the_red_house_is_not_beside_the_blue_house(HOUSEs)
:-
HOUSEs contains {position:POSITION_RED,color:'red',nationality:_,pet:_,sport:_} ,
HOUSEs contains {position:POSITION_BLUE,color:'blue',nationality:_,pet:_,sport:_} ,
DISTANCE is abs(POSITION_BLUE - POSITION_RED) ,
DISTANCE > 1
.

the_pet_fish_is_not_in_the_red_house(HOUSEs)
:-
\+ HOUSEs contains {position:_,color:'red',nationality:_,pet:'fish',sport:_}
.


HOUSEs contains HOUSE
:-
lists:member(HOUSE,HOUSEs)
.

