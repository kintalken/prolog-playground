
%! list_without_middle(SOURCEs,TARGETs)

list_without_middle(SOURCEs,TARGETs)
:-
list_middle(SOURCEs,_MIDDLE_,PREFIXs,SUFFIXs) ,
lists:append(PREFIXs,SUFFIXs,TARGETs)
.

