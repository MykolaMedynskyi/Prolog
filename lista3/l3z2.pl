max_sum(L, X) :-    % Kadane
    L = [F|List],
    max_s(List, F, F, X), !.

max_s([], _, Max, Max).
max_s([X|L], Loc, Glo, Max) :-
    S is X + Loc,
    max(S, X, M),
    max(M, Glo, G),
    max_s(L, M, G, Max).


max(X, Y, X) :-
    X > Y.

max(X, Y, Y) :-
    X =< Y.

