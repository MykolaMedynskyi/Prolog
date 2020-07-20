p([]) --> [].
p([X|Xs]) --> [X], p(Xs).

ab --> a(N), b(N).
a(0) --> ``.
a(N) --> `a`, a(N1), {N is N1+1}.
b(0) --> ``.
b(N) --> `b`, b(N1), {N is N1+1}.

abc --> a(N), b(N), c(N).
c(0) --> ``.
c(N) --> `c`, c(N1), {N is N1+1}.


fib(0, 0) :- !.
fib(1, 1) :- !.
fib(X, Y) :-
    X1 is X-1,
    X2 is X-2,
    fib(X1, Y1),
    fib(X2, Y2),
    Y is Y1 + Y2.

afibb --> a(N), {fib(N, X)}, b(X).
