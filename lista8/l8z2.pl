:- use_module(library(clpfd)).


waga([], [], [], 0, 0).
waga([X|TX], [Wartosc|TWa], [Wielkosc|TWie], Waga, Sum) :-
    waga(TX, TWa, TWie, Waga2, Sum2),
    Waga is Waga2 + Wielkosc * X,
    Sum is Sum2 + Wartosc * X.


plecak(Wartosci, Wielkosci, Pojemnosc, X) :-
    length(Wartosci, L),
    length(X, L),
    X ins 0..1,
    Waga #=< Pojemnosc,
    waga(X, Wartosci, Wielkosci, Waga, Sum),
    once(labeling([max(Sum)], X)).

plecak2(Wa, Wie, Po, X) :-
    X = [A1, A2, A3, A4, A5],
    Wa = [W1, W2, W3, W4, W5],
    Wie = [V1, V2, V3, V4, V5],
    X ins 0..1,
    Waga #= V1*A1 + V2*A2 + V3*A3 + V4*A4 + V5*A5,
    Sum #= W1*A1 + W2*A2 + W3*A3 + W4*A4 + W5*A5,
    Waga #=< Po,
    once(labeling([max(Sum)], X)).

plecak3(Wartosci, Wielkosci, Pojemnosc, X) :-
    length(Wartosci, L),
    length(X, L),
    X ins 0..1,
    scalar_product(Wielkosci, X, #=<, Pojemnosc),
    scalar_product(Wartosci, X, #=, Sum),
    once(labeling([max(Sum)], X)).

