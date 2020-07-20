jednokrotnie(X, L) :-
    count(X, L, 1).

dwukrotnie(X, L) :-
    count(X, L, 2).

count(_, [], 0).
count(X, [X|T], N) :-
    count(X, T, Num),
    N is Num + 1.
count(X, [Y|T], N) :-
    count(X, T, N),
    X \= Y.
