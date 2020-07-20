filozofowie :-
    thread_create(filozof(1), _, [detached(true)]),
    thread_create(filozof(2), _, [detached(true)]),
    thread_create(filozof(3), _, [detached(true)]),
    thread_create(filozof(4), _, [detached(true)]),
    thread_create(filozof(5), _, [detached(true)]).



filozof(ID) :-
    mysli(ID),
    ssppw(ID),
    ppw(ID),
    ssplw(ID),
    plw(ID),
    je(ID),
    opw(ID),
    olw(ID),
    filozof(ID).


space(1, '').
space(2, '      ').
space(3, '            ').
space(4, '                  ').
space(5, '                        ').

lewy(1, 5).
lewy(X, Y) :-
    Y is X - 1.


my_print(ID, Text) :-
    space(ID, Space),
    mutex_lock(my_p),
    format('~w[~w] ~w~n', [Space, ID, Text]),
    sleep(0.03),
    mutex_unlock(my_p).


mysli(ID) :-
    my_print(ID, 'mysli').


ssppw(ID) :-
    my_print(ID, 'stara sie podniesc prawy widelec').


ppw(ID) :-
    lewy(ID, Lewy),
    atom_number(MID, ID),
    atom_number(MLewy, Lewy),
    mutex_lock(MLewy),
    mutex_lock(MID),    % prawy
    my_print(ID, 'podniosl prawy widelec').



ssplw(ID) :-
    my_print(ID, 'stara sie podniesc lewy widelec').


plw(ID) :-
    my_print(ID, 'podniosl lewy widelec').


je(ID) :-
    my_print(ID, 'je').


opw(ID) :-
    atom_number(MID, ID),
    my_print(ID, 'odklada prawy widelec'),
    mutex_unlock(MID).

olw(ID) :-
    lewy(ID, Lewy),
    atom_number(MLewy, Lewy),
    my_print(ID, 'odklada lewy widelec'),
    mutex_unlock(MLewy).



