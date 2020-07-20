dobra(X) :-
    \+ zla(X).

zla(X) :-
    append(_, [Wi|L1], X),
    append(L2, [Wj|_], L1),
    length(L2, K),
    abs(Wi-Wj) =:= K + 1.

hetmany(N, P) :-
    numlist(1, N, L),
    permutation(L, P),
    dobra(P).


board(L) :-
    length(L, Len),
    Dark is Len mod 2,
    draw_board(Len, Len, Dark, L), !.


draw_board(0, Len, _, _) :-
    draw_line(Len).
draw_board(L, Len, Dark, List) :-
    draw_line(Len),
    List2 = List,
    draw_tiles(Len, List2, Dark, L),
    draw_tiles(Len, List2, Dark, L),
    Dark2 is abs(Dark - 1),
    L2 is L - 1,
    draw_board(L2, Len, Dark2, List).


draw_tiles(0, _, _, _) :-
    format('|~n').
draw_tiles(L, [N|T], Dark, N) :-
    !,
    (Dark is 1
    -> D = '|:###:'
    ; D = '| ### '),
    format('~w', D),
    Dark2 is abs(Dark - 1),
    L2 is L - 1,
    draw_tiles(L2, T, Dark2, N).
draw_tiles(L, [_|T], Dark, N) :-
    (Dark is 1
    -> D = '|:::::'
    ; D = '|     '),
    format('~w', D),
    Dark2 is abs(Dark - 1),
    L2 is L - 1,
    draw_tiles(L2, T, Dark2, N).



draw_line(0) :-
    format('+~n').
draw_line(L) :-
    format('+-----'),
    L2 is L - 1,
    draw_line(L2).
