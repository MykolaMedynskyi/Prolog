arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

arc(X, X).

osiagalny(X, Y) :-
    reachable_(X, Y, []).

reachable_(X, X, []).
reachable_(X, Y, Visited) :-
    arc(X, Y),
    X \= Y,
    \+ member(Y, Visited).
reachable_(X, Z, Visited) :-
    append([X], Visited, Acc),
    arc(X, Y),
    \+ member(Y, Acc),
    reachable_(Y, Z, Acc).

