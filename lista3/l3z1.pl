wariancja(L, X) :-
    sum(L, S, Len),
    Avg is S/Len,
    war(L, Avg, W),
    X is W/Len.


sum([], 0, 0).
sum([X|L], Sum, Len) :-
    sum(L, S1, Len1),
    Sum is S1 + X,
    Len is Len1 + 1.


war([], _, 0).
war([X|L], Avg, W) :-
    war(L, Avg, W1),
    W is ((Avg - X) ** 2) + W1.
