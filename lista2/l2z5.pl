lista(N, X) :-
    generate(N, 0, B),
    B = [_|A],
    lista(N, X1, A, B, 1, 1),
    %lista2(N, X1, A, B, 1),
    X = [1|X1].

lista(_, [], [], [], 0, _).

lista(N, [X|L], A, B, 0, N):-
    select(X, A, A1),
    lista(N, L, A1, B, 1, N).

lista(N, [X|L], A, B, 1, N):-
    select(X, B, B1),
    lista(N, L, A, B1, 0, N).


lista(N, [X|L], A, B, 0, Max):-
    N \= Max,
    select(X, A, A1),
    Max + 1 >= X,
    max(Max, X, NMax),
    lista(N, L, A1, B, 1, NMax).

lista(N, [X|L], A, B, 1, Max):-
    N \= Max,
    select(X, B, B1),
    Max + 1 >= X,
    max(Max, X, NMax),
    lista(N, L, A, B1, 0, NMax).



max(A, B, A) :-
    A >= B.
max(A, B, B) :-
    B > A.


generate(N, N, []) :- !.  % list from (x-1) to n
generate(N, X, L) :-
    X1 is X + 1,
    L = [X1|List],
    generate(N, X1, List).


infs(N) :-
    between(1, N, X),
    write(X),
    time((lista(X, _), fail)).






