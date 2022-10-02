roots(A, B, C, X1, X2) :-
    X1 is (-B - sqrt(B * B - 4 * A * C)) / (2 * A),
    X2 is (-B + sqrt(B * B - 4 * A * C)) / (2 * A).
