permutations([], []).
permutations(Lx, [X|Ly]) :-
    select(X, Lx, Lx2),
    permutations(Lx2, Ly).


invers([], 0).

invers([X|L], N) :-
    invers(L, N2),
    inversions(X, L, N1),
    N is N1 + N2, !.


inversions(_, [], 0).

inversions(X, [Y|L], N) :-
    inversions(X, L, N1),
    (X > Y -> N is N1 + 1; N is N1).


even_permutation(L, X) :-
    permutations(L, X),
    invers(X, N),
    0 is N mod 2.

odd_permutation(L, X) :-
    permutations(L, X),
    invers(X, N),
    1 is N mod 2.
