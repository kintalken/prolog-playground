%  Prolog program to solve the zebra problem.
%  Aug 1984, Dan Sahlin, The Royal Inst. of Techn., Stockholm, Sweden
% (revised October, 1985, P. H. Roosen-Runge)


        :- op(100,xfy,on).  % a bit of grammar

% Who owns the zebra and who drinks water?
find(ZebraOwner,WaterDrinker) :-

%       ************  THE FACTS **************************************
%    There are 5 houses, occupied by politically-incorrect
%    gentlemen of 5 different nationalities, who all have different
%    coloured houses, keep different pets, drink different drinks, and smoke
%    different  (now-extinct) brands of cigarettes.

        makehouses(5, List),                                        %1
%    The Englishman lives in a red house.
        house(  red,  englishman,    _,      _,       _)   on List, %2
%    The Spaniard keeps a dog.
        house(    _,    spaniard,  dog,      _,       _)   on List, %3
%    The owner of the green house drinks coffee.
        house(green,           _,    _, coffee,       _)   on List, %4
%    The Ukrainian drinks tea.
        house(    _,   ukrainian,    _,    tea,       _)   on List, %5
%    The ivory house is just to the left of the green house.
      sublist2( [house(ivory,           _,    _,      _,       _) ,
                house(green,           _,    _,      _,       _)], List), %6
%    The owner of a pet snail smokes Old Gold.
        house(    _,           _,snail,      _,old_gold)   on List, %7
%    The owner of the yellow house smokes Kools.
        house(yellow,          _,    _,      _,   kools)   on List, %8
%    The owner of the third house drinks milk.
     List = [_, _,
        house(    _,           _,    _,   milk,       _),
             _, _],                                                 %9
%    A Norwegian owns the first house.
     List =
       [house(    _,   norwegian,    _,      _,       _) | _], %10
%    The Chesterfields smoker lives next to a house with a fox.
 nextto(house(    _,           _,    _,      _, chesterfields),
        house(    _,           _,  fox,      _,         _), List),  %11
%   The horse owner lives next to the Kools smoker.
 nextto(house(    _,           _,    _,      _,    kools),
        house(    _,           _,horse,      _,        _), List),   %12
%   The Lucky Striker smoker drinks orange juice.
        house(    _,           _,    _, orange, lucky_strike) on List, %13
%   The Japanese smokes Parliaments.
        house(    _,    japanese,    _,      _, parliaments ) on List, %14
%   The Norwegian lives next to a blue house.
 nextto(house(    _,   norwegian,    _,      _,          _),
        house( blue,           _,    _,      _,          _), List), %15

        house(    _, WaterDrinker,    _,  water,          _)  on List,
        house(    _,  ZebraOwner,zebra,      _,          _)  on List.


%       ********** DEFINITIONS ************************************

        makehouses(0,[]).

        makehouses(N,[house(_, _, _, _, _)|List])
                :- N>0, N1 is N - 1, makehouses(N1,List).

        X on List :- member(X, List).

        sublist2([S1, S2], [S1, S2 | _]) .
        sublist2(S, [_ | T]) :- sublist2(S, T).

        nextto(H1, H2, L) :- sublist2([H1, H2], L).
        nextto(H1, H2 ,L) :- sublist2([H2, H1], L).  
