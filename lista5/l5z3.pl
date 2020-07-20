father(T, Father, Kid) :-
    con(f(T), Father),
    contain(Father, Kid).

contain(T1, T2) :-
    T1 =.. [_|A],
    member(T2, A).

con(T1, T2) :-
    contain(T1, T2).
con(T1, T2) :-
    contain(T1, T3),
    con(T3, T2).


first_kido(Father, Kid) :-
    Father =.. [_, Kid|_].

next(T, T1, T2) :-
    father(T, F, T1),
    F =.. [_|A],
    append(_, [T1, T2|_], A).

prev(T, T1, T2) :-
    father(T, F, T1),
    F =.. [_|A],
    append(_, [T2, T1|_], A).


browse(T) :-
    go(T, T).

go(T, Cur) :-
    format('~w~n', Cur),
    read(C),
    do(T, Cur, C).


do(T, Cur, 'i') :-
    first_kido(Cur, Kid),
    go(T, Kid).

do(T, Cur, 'o') :-
    father(T, Father, Cur),
    go(T, Father).

do(T, Cur, 'n') :-
    next(T, Cur, Next),
    go(T, Next).

do(T, Cur, 'p') :-
    prev(T, Cur, Prev),
    go(T, Prev).
