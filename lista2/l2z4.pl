regula(X, +, Y, Y) :-
    number(X),
    X =:= 0, !.
regula(X, +, Y, X) :-
    number(Y),
    Y =:= 0, !.

regula(X, -, X, 0) :- !.
regula(X, -, Y, X) :-
    number(Y),
    Y =:= 0, !.

regula(X, /, X, 1) :- !.
regula(X, /, Y, 0) :-
    number(X),
    X =:= 0,
    Y \= X, !.

regula(X, *, _, 0) :-
    number(X),
    X =:= 0, !.
regula(_, *, X, 0) :-
    number(X),
    X =:= 0, !.
regula(X, *, Y, X) :-
    number(Y),
    Y =:= 1, !.
regula(X, *, Y, Y) :-
    number(X),
    X =:= 1, !.

regula('(', X, ')', X) :- !.


uprosc(Wyrazenie, Wynik) :-
    atom_chars(Wyrazenie, X),
    uproscDM(X, Res),
    atomic_list_concat(Res, '', Wynik).


uproscDM([X], [X]) :- !.

uproscDM(Wyrazenie, Wynik) :-
    replace_first(Wyrazenie, [], Wynik),
    \+ replace_first(Wynik, [], _), !.

uproscDM(Wyrazenie, Wyrazenie) :-
    \+ replace_first(Wyrazenie, [], _), !.

uproscDM(Wyrazenie, Wynik) :-
    replace_first(Wyrazenie, [], Cos),
    uproscDM(Cos, Wynik).


uprosc_first_three(List, A) :-
    List = [X|List2],
    List2 = [Y|List3],
    List3 = [Z|List4],
    regula(X, Y, Z, W), !,
    append([W], List4, A).


replace_first(List, Pre, After) :-
    \+ uprosc_first_three(List, _),
    List = [X|New_list],
    append(Pre, [X], New_pre), !,
    replace_first(New_list, New_pre, After).

replace_first(List, Pre, After) :-
    uprosc_first_three(List, Ans),
    append(Pre, Ans, After), !.

