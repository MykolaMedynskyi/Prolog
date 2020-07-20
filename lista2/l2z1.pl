srodkowy(L, X) :-
    length(L, Len),
    1 is Len mod 2,
    Pos is (Len + 1) / 2,
    middle(L, X, Pos).

middle([X|_], X, 1).
middle([_|T], X, Pos) :-
    P is Pos - 1,
    middle(T, X, P),
    !.
