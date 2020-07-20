white(' ').
white('\t').
white('\n').

semicolon(';').

key(read).
key(write).
key(if).
key(then).
key(else).
key(fi).
key(while).
key(do).
key(od).
key(and).
key(or).
key(mod).

sep(';').
sep('+').
sep('-').
sep('*').
sep('/').
sep('(').
sep(')').
sep('<').
sep('>').
sep('=<').
sep('>=').
sep(':=').
sep('=').
sep('/=').



scanner(Stream, Code) :-
    get_char(Stream, C),
    read_next(Stream, C, Code).


read_next(_, end_of_file, []) :-
    !.
read_next(Stream, C, Code) :-
    white(C),
    !,
    get_char(Stream, C2),
    read_next(Stream, C2, Code).
read_next(Stream, C, [T|Code]) :-
    semicolon(C),
    !,
    T = sep(C),
    get_char(Stream, C2),
    read_next(Stream, C2, Code).
read_next(Stream, C, [W|Code]) :-
    read_word(Stream, C, C2, '', Word),
    give_token(Word, W),
    read_next(Stream, C2, Code).


read_word(_, end_of_file, end_of_file, W, W) :-
    !.
read_word(_, C, C, W, W) :-
    white(C),
    !.
read_word(_, C, C, W, W) :-
    semicolon(C),
    !.
read_word(Stream, C1, C3, N1, N) :-
    atom_concat(N1, C1, N2),
    get_char(Stream, C2),
    read_word(Stream, C2, C3, N2, N).


give_token(Word, Token) :-
    key(Word),
    !,
    Token = key(Word).
give_token(Word, Token) :-
    sep(Word),
    !,
    Token = sep(Word).
give_token(Word, Token) :-
    atom_number(Word, N),
    !,
    Token = int(N).
give_token(Word, Token) :-
    Token = id(Word).
