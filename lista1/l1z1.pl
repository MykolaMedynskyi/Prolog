father(anatoli, pawel).
father(anatoli, ola).
father(anatoli2, mykola).
mother(lida, pawel).
mother(lida, ola).
mother(ola, mykola).
male(anatoli).
male(pawel).
male(anatoli2).
female(ola).
female(lida).

parent(X, Y) :-
    father(X, Y);
    mother(X, Y).

is_mother(X) :-
    mother(X, _).

is_father(X) :-
    father(X, _).

is_son(X) :-
    male(X).

sister(X, Y) :-
    female(X),
    father(F, X),
    father(F, Y),
    mother(M, X),
    mother(M, Y),
    X \= Y.

grandfather(X, Y) :-
    male(X),
    father(X, Z),
    parent(Z, Y).

sibling(X, Y) :-
    father(F, X),
    father(F, Y),
    mother(M, X),
    mother(M, Y),
    X \= Y.
