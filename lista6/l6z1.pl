program([]) --> [].
program([INSTRUKCJA|PROGRAM]) --> instrukcja(INSTRUKCJA), [sep(;)], program(PROGRAM).

instrukcja(assign(ID, WYRAZENIE)) --> [id(ID), sep(:=)], wyrazenie(WYRAZENIE).
instrukcja(read(ID)) --> [key(read), id(ID)].
instrukcja(write(WYRAZENIE)) --> [key(write)], wyrazenie(WYRAZENIE).
instrukcja(if(WARUNEK, PROGRAM)) --> [key(if)], warunek(WARUNEK), [key(then)], program(PROGRAM), [key(fi)].
instrukcja(if(WARUNEK, PROGRAM1, PROGRAM2)) --> [key(if)], warunek(WARUNEK), [key(then)], program(PROGRAM1), [key(else)], program(PROGRAM2), [key(fi)].
instrukcja(while(WARUNEK, PROGRAM)) --> [key(while)], warunek(WARUNEK), [key(do)], program(PROGRAM), [key(od)].

wyrazenie(SKLADNIK + WYRAZENIE) --> skladnik(SKLADNIK), [sep(+)], wyrazenie(WYRAZENIE).
wyrazenie(SKLADNIK - Y) --> skladnik(SKLADNIK), [sep(-)], wyrazenie(Y).
wyrazenie(SKLADNIK) --> skladnik(SKLADNIK).

skladnik(CZYNNIK * SKLADNIK) --> czynnik(CZYNNIK), [sep(*)], skladnik(SKLADNIK).
skladnik(CZYNNIK / SKLADNIK) --> czynnik(CZYNNIK), [sep(/)], skladnik(SKLADNIK).
skladnik(CZYNNIK mod SKLADNIK) --> czynnik(CZYNNIK), [key(mod)], skladnik(SKLADNIK).
skladnik(X) --> czynnik(X).

czynnik(id(ID)) --> [id(ID)].
czynnik(int(NUM)) --> [int(NUM)].
czynnik(WYRAZENIE) --> [sep('(')], wyrazenie(WYRAZENIE), [sep(')')].

warunek(KONIUNKCJA ; WARUNEK) --> koniunkcja(KONIUNKCJA), [key(or)], warunek(WARUNEK).
warunek(KONIUNKCJA) --> koniunkcja(KONIUNKCJA).

koniunkcja(PROSTY ',' KONIUNKCJA) --> prosty(PROSTY), [key(and)], koniunkcja(KONIUNKCJA).
koniunkcja(PROSTY) --> prosty(PROSTY).

prosty(WYRAZENIE1 =:= WYRAZENIE2) --> wyrazenie(WYRAZENIE1), [sep(=)], wyrazenie(WYRAZENIE2).
prosty(WYRAZENIE1 =\= WYRAZENIE2) --> wyrazenie(WYRAZENIE1), [sep(/=)], wyrazenie(WYRAZENIE2).
prosty(WYRAZENIE1 < WYRAZENIE2) --> wyrazenie(WYRAZENIE1), [sep(<)], wyrazenie(WYRAZENIE2).
prosty(WYRAZENIE1 > WYRAZENIE2) --> wyrazenie(WYRAZENIE1), [sep(>)], wyrazenie(WYRAZENIE2).
prosty(WYRAZENIE1 =< WYRAZENIE2) --> wyrazenie(WYRAZENIE1), [sep(=<)], wyrazenie(WYRAZENIE2).
prosty(WYRAZENIE1 >= WYRAZENIE2) --> wyrazenie(WYRAZENIE1), [sep(>=)], wyrazenie(WYRAZENIE2).
prosty(WARUNEK) --> [sep('(')], warunek(WARUNEK), [sep(')')].
