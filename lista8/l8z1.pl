:- use_module(library(clpfd)).

kolorowanie(Colors) :-
    Colors = [C1, C2, C3, C4, C5, C6, C7, C8, C9],
    Colors ins 1..3,
    C1 #\= C2,
    C1 #\= C4,
    C1 #\= C5,
    C1 #\= C6,
    C2 #\= C4,
    C2 #\= C3,
    C2 #\= C9,
    C3 #\= C4,
    C3 #\= C5,
    C3 #\= C9,
    C4 #\= C5,
    C5 #\= C6,
    C5 #\= C7,
    C5 #\= C9,
    C6 #\= C7,
    C6 #\= C8,
    C7 #\= C8,
    C7 #\= C9,
    C8 #\= C9.
