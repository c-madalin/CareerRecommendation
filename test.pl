sumDigits(0, 0) :- !. 
sumDigits(Number, Sum) :-
    Number > 0,
    Digit is Number mod 10,
    Digit mod 2 =:= 1,
    NumberNow is Number div 10,
    sumDigits(NumberNow, SumNew),
    Sum is Digit + SumNew.

sumDigits(Number, Sum) :-
    Number > 0,
    Digit is Number mod 10,
    Digit mod 2 =:= 0,
    NumberNow is Number div 10,
    sumDigits(NumberNow, SumNew),
    Sum is SumNew.

occ([], _, 0). 
occ([Head|Tail], Val, Rez) :-
    Head =:= Val,
    occ(Tail, Val, RezNew),
    Rez is RezNew + 1.
occ([Head|Tail], Val, Rez) :-
    Head =\= Val,
    occ(Tail, Val, RezNew),
    Rez is RezNew.

sterge([], _, []). 
sterge([Head|Tail], Val, Rez) :-
    Head =:= Val,
    sterge(Tail, Val, RezNew),
    Rez = RezNew.
sterge([Head|Tail], Val, Rez) :-
    Head =\= Val,
    sterge(Tail, Val, RezNew),
    Rez = [Head|RezNew].