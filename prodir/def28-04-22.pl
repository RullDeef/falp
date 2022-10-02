oper(A, plus, B, R) :- R #= A + B.
oper(A, minus, B, R) :- R #= A - B.
oper(A, mult, B, R) :- R #= A * B.
oper(A, div, B, R) :- R #= A // B.
oper(A, mod, B, R) :- R #= A - (A // B) * B.

solve([Op1, Op2, Op3]) :-
    oper(5, Op1, 2, R1),
    oper(R1, Op2, 3, R2),
    oper(R2, Op3, 4, 10).
