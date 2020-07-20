lista(1, [1, 1]):- !.
lista(N, X) :-
    lista(N, X1, [1, 2], [2], 2),
    X = [1|X1].

lista(N, [], [], [], N).

lista(N, [X|L], A, B, N) :-
    select(X, A, A1),
    lista(N, L, B, A1, N).

lista(N, [X|L], A, B, Max) :-
    N \= Max,
    select(X, A, A1),
    (Max > X -> lista(N, L, B, A1, Max);
    NMax is Max + 1, A2 = [NMax|A1], B2 = [NMax|B], lista(N, L, B2, A2, NMax)).

%lista(N, [X|L], A, B, Max) :-
%    N \= Max,
%    select(X, A, A1),
%    check(X, A1, A2, B, B2, Max, NMax),
%    lista(N, L, B2, A2, NMax).

%check(X, A, A, B, B, Max, Max) :-
%    Max > X.
%check(X, A, A2, B, B2, X, NMax) :-
%    NMax is X + 1,
%    A2 = [NMax|A],
%    B2 = [NMax|B].



infs(N) :-
    between(1, N, X),
    write(X),
    time((lista(X, _), fail)).


