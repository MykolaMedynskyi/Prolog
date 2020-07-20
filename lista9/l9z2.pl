:- use_module(library(clpfd)).

getSquares([], _, _, [], []).
getSquares([S|T], W, H, [X, Y|T2], [f(X, S, Y, S)|T3]) :-
    R1 is W - S,
    R2 is H - S,
    X in 0..R1,
    Y in 0..R2,
    getSquares(T, W, H, T2, T3).

kwadraty(S, W, H, X) :-
    getSquares(S, W, H, X, List),
    disjoint2(List),
    label(X).
