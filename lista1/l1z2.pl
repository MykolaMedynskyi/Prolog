on(block1, block2).
on(block2, block3).
on(block3, block4).
on(block4, block5).
on(block5, block6).
on(block6, block7).
on(block7, block8).
on(block8, block9).

above(X, Y) :-
    on(X, Y).
above(X, Z) :-
    on(X, Y),
    above(Y, Z).
