
%!  list_middle(LISTs,MIDDLE)

list_middle(LISTs,MIDDLE)
:-
list_middle(LISTs,MIDDLE,_PREFIXs_,_SUFFIXs_)
.

%!  list_middle(LISTs,MIDDLE,PREFIXs,SUFFIXs)

list_middle([ITEM|LISTs],MIDDLE,PREFIXs,SUFFIXs)
:-
list_middle(LISTs,LISTs,ITEM,MIDDLE,PREFIXs,SUFFIXs)
.

%!  list_middle(FASTs,SLOWs,ITEM,MIDDLE,PREFIXs,SUFFIXs)

list_middle([],SLOWs,ITEM,ITEM,[],SLOWs) .

list_middle([_,_|FASTs],[ITEM|SLOWs],PREVIOUS_ITEM,MIDDLE,[PREVIOUS_ITEM|PREFIXs],SUFFIXs)
:-
list_middle(FASTs,SLOWs,ITEM,MIDDLE,PREFIXs,SUFFIXs)
.

