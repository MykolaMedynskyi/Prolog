le(b, a).
le(c, b).
le(d, b).
le(a, a).
le(d, d).
le(b, b).
le(c, c).
le(c, a).
le(d, a).



maksymalny(X) :-
    le(_, X),
    \+ (le(X, Y), Y \= X).

kilkamaks :-
    maksymalny(X),
    maksymalny(Y),
    Y \= X,
    !.

najwiekszy(X) :-
    maksymalny(X),
    \+ kilkamaks.

minimalny(X) :-
    le(X, _),
    \+ (le(Y, X), X \= Y).

kilkamin :-
    minimalny(X),
    minimalny(Y),
    Y \= X,
    !.

najmniejszy(X) :-
    minimalny(X),
    \+ kilkamin.
