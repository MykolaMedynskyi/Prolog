is_left_of(pancil, timer).
is_left_of(timer, butterfly).
is_left_of(butterfly, fish).
is_left_of(bike, camera).

left_of(X, Z) :-
    is_left_of(X, Z).
left_of(X, Z) :-
    is_left_of(X, Y),
    left_of(Y, Z).

is_above(bike, pancil).
is_above(camera, butterfly).

above(X, Z) :-
    is_above(X, Z).
above(X, Z) :-
    is_above(X, Y),
    above(Y, Z).

right_of(X, Y) :-
    left_of(Y, X).

below(X, Y) :-
    above(Y, X).

higher(X, Y) :-
    above(X, Y).
higher(X, Y) :-
    left_of(Z, Y),
    above(X, Z).
higher(X, Y) :-
    right_of(Z, Y),
    above(X, Z).




