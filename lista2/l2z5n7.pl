lista(1, [1, 1]):- !.
lista(N, X) :-
    lista(N, X1, [1, 2], [2], 2),
    X = [1|X1].
lista(N, X) :-
    lista(N, X1, [2, 1], [2], 2),
    X = [1|X1].

lista(N, [], [], [], N).

lista(N, [X|L], [X|A], B, N) :-
    lista(N, L, B, A, N).

lista(N, [X|L], [X|A], B, Max) :-
    N \= Max,
    X \= Max,
    lista(N, L, B, A, Max).

lista(N, [X|L], [X|A], B, X) :-
    N \= X,
    NMax is X + 1,
    select(NMax, A2, A),
    select(NMax, B2, B),
    lista(N, L, B2, A2, NMax).



infs(N) :-
    between(1, N, X),
    write(X),
    time((lista(X, _), fail)).


