:-[l7z1].

split(IN, OUT1, OUT2) :-
    freeze(IN, splitImp(IN, OUT1, OUT2)).


splitImp([], [], []).
splitImp(IN, OUT1, OUT2) :-
    IN = [H|T],
    OUT1 = [H|OUT],
    freeze(T, split(T, OUT2, OUT)).


merge_sort(IN, OUT) :-
    freeze(IN, merge_sort_imp(IN, OUT)).


merge_sort_imp([], []).
merge_sort_imp(IN, OUT) :-
    IN = [_|T],
    freeze(T,
          (   T = []
          ->  (OUT = IN)
          ;   (split(IN, OUT1, OUT2),
              merge_sort_imp(OUT1, OUT11),
              merge_sort_imp(OUT2, OUT22),
              merge1(OUT11, OUT22, OUT)))).

