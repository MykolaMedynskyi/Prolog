lista(1, [1, 1]).
lista(N, X) :-
    lista(N, X1, [2], [1, 2], 1, 2),
    X = [1|X1].

lista(N, [], [], [], 0, N).

lista(N, [X|L], A, B, 0, N) :-
    select(X, A, A1),
    lista(N, L, A1, B, 1, N).

lista(N, [X|L], A, B, 1, N) :-
    select(X, B, B1),
    lista(N, L, A, B1, 0, N).


lista(N, [X|L], A, B, 1, Max) :-
    N \= Max,
    select(X, B, B1),
    check(X, A, A2, B1, B2, Max, NMax),
    lista(N, L, A2, B2, 0, NMax).

lista(N, [X|L], A, B, 0, Max) :-
    N \= Max,
    select(X, A, A1),
    check(X, A1, A2, B, B2, Max, NMax),
    lista(N, L, A2, B2, 1, NMax).

check(X, A, A, B, B, Max, Max) :-
    Max > X.
check(X, A, A2, B, B2, X, NMax) :-
    NMax is X + 1,
    append(A, [NMax], A2),
    append(B, [NMax], B2).



infs(N) :-
    between(2, N, X),
    write(X),
    time((lista(X, _), fail)).
