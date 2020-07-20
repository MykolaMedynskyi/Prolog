:- use_module(library(clpfd)).

plecak(Wartosci, Wielkosci, Pojemnosc, X) :-
    length(Wartosci, L),
    length(X, L),
    X ins 0..1,
    scalar_product(Wielkosci, X, #=<, Pojemnosc),
    scalar_product(Wartosci, X, #=, Sum),
    once(labeling([max(Sum)], X)).
