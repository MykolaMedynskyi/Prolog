prime(L, H, N) :-
    between(L, H, N),
    is_prime(N).


is_prime(2).
is_prime(X) :-
    X > 2,
    not(divisible(X, 2)).

divisible(X, Y) :-
    0 is X mod Y.
divisible(X, Y) :-
    Y < floor(sqrt(X)),
    divisible(X, Y+1).
