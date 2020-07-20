add_op(X, T1, T2) :-
    X = T1 + T2.
add_op(X, T1, T2) :-
    X = T1 - T2.
add_op(X, T1, T2) :-
    X = T1 * T2.
add_op(X, T1, T2) :-
    \+ (0 =:= T2),
    X = T1 / T2.

generate([X], X).
generate(L, X) :-
	append(L1, L2, L),
	\+ length(L1, 0),
	\+ length(L2, 0),
	generate(L1, T1),
	generate(L2, T2),
	add_op(X, T1, T2).

wyrazenie(LIST, VALUE, EXPRESSION) :-
	generate(LIST, X),
        VALUE is X,
        EXPRESSION = X, !.
