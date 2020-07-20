le(b, a).
le(c, b).
le(d, b).
le(a, a).
le(d, d).
le(b, b).
le(c, c).
le(c, a).
le(d, a).



czepo :-
    \+ ((le(X, _); le(_, X)), \+ le(X, X)),
    \+ (le(X, Y), le(Y, X), Y \= X),
    \+ (le(X, Y), le(Y, Z), \+ le(X, Z)).
