merge1(IN1, IN2, OUT) :-
    freeze(IN1, freeze(IN2, mergeImp(IN1, IN2, OUT))).

mergeImp(IN1, [], IN1).
mergeImp([], IN2, IN2).
mergeImp(IN1, IN2, OUT) :-
    IN1 = [H1|T1],
    IN2 = [H2|T2],
    (   H1 >= H2
    ->  OUT = [H2|OUT1],
        freeze(T2, mergeImp(IN1, T2, OUT1))
    ;   OUT = [H1|OUT1],
        freeze(T1, mergeImp(T1, IN2, OUT1))
    ).
