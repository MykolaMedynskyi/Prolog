zapalki(N, (duze(A), srednie(B), male(C))) :-
    All = [[1, '---'], [2, '---'], [3, '---'],
          [4, '|'], [5, '|'], [6, '|'], [7, '|'],
          [8, '---'], [9, '---'], [10, '---'],
          [11, '|'], [12, '|'], [13, '|'], [14, '|'],
	  [15, '---'], [16, '---'], [17, '---'],
          [18, '|'], [19, '|'], [20, '|'], [21, '|'],
	  [22, '---'], [23, '---'], [24, '---']],



    All_duze = [[1, 2, 3, 7, 14, 21, 24, 23, 22, 18, 11, 4]],

    All_srednie = [[1, 2, 6, 13, 16, 15, 11, 4],
                   [2, 3, 7, 14, 17, 16, 12, 5],
                   [9, 10, 14, 21, 24, 23, 19, 12],
                   [8, 9, 13, 20, 23, 22, 18, 11]],

    All_male = [[1, 5, 8, 4], [2, 6, 9, 5], [3, 7, 10, 6],
                [8, 12, 15, 11], [9, 13, 16, 12], [10, 14, 17, 13],
                [15, 19, 22, 18], [16, 20, 23, 19], [17, 21, 24, 20]],


    add_sticks([], All_male, C, SticksM),
    add_sticks(SticksM, All_srednie, B, SticksMS),
    add_sticks(SticksMS, All_duze, A, SticksMSD),

    length(SticksMSD, LEN),
    N is 24 - LEN,


    sort(0, @=<, SticksMSD, Sticks),

    get_draw(All, Sticks, DRAW),

    format('
          x~wx~wx~wx
          ~w   ~w   ~w   ~w
          x~wx~wx~wx
	  ~w   ~w   ~w   ~w
	  x~wx~wx~wx
          ~w   ~w   ~w   ~w
          x~wx~wx~wx', DRAW).


get_draw([], [], []).
get_draw([[N, P]|T], [N|S], X) :-
    !,
    get_draw(T, S, X1),
    X = [P|X1].

get_draw([[_,P]|T], S, X) :-
    get_draw(T, S, X1),
    mute(P, M),
    X = [M|X1].


mute(X, ' ') :-
    atom_length(X, 1).

mute(X, '   ') :-
    atom_length(X, 3).


%add_sticks(W, _, 0, W).
%add_sticks(S, A, X, W) :-
%    select(Add, A, A2),
%    union(S, Add, S2),
%    X2 is X - 1,
%    add_sticks(S2, A2, X2, W).


add_sticks(W, _, 0, W).
add_sticks(S, A, X, W) :-
    append(_, [E|A2], A),
    union(S, E, S2),
    X2 is X - 1,
    X2 >= 0,
    add_sticks(S2, A2, X2, W).




