%    narodowość,    kolor,   papierosy,   napój,   kot
einstein(Domy) :-
    Domy = [[norweg,_,_,_,_],_,[_,_,_,mleko,_],_,_],     % 1, 8

    member([anglik,czerwony,_,_,_], Domy),               % 2

    po_lewej([_,zielony,_,_,_], [_,bialy,_,_,_], Domy),  % 3

    member([dunczyk,_,_,herbata,_], Domy),               % 4

    sasiad([_,_,light,_,_], [_,_,_,_,kot], Domy),        % 5

    member([_,zolty,cygara,_,_], Domy),                  % 6

    member([niemiec,_,fajke,_,_], Domy),                 % 7

    sasiad([_,_,light,_,_], [_,_,_,woda,_], Domy),       % 9

    member([_,_,filterfree,_,ptaki], Domy),              % 10

    member([szwed,_,_,_,psy], Domy),                     % 11

    sasiad([norweg,_,_,_,_], [_,niebieski,_,_,_], Domy), % 12

    sasiad([_,_,_,_,koni], [_,zolty,_,_,_], Domy),       % 13

    member([_,_,mentolowe,piwo,_], Domy),                % 14

    member([_,zielony,_,kawa,_], Domy).                  % 15


sasiad(X, Y, D) :-
    append(_, [X,Y|_], D);
    append(_, [Y,X|_], D).

po_lewej(X, Y, D) :-
    append(_, [X,Y|_], D).


rybki(Kto) :-
    einstein(Domy),
    member([Kto,_,_,_,ryby], Domy), !.
