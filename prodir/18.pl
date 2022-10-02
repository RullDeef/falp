gt([], _, []) :- !.
gt([H|T], X, [H|T2]) :-
    H #> X,
    gt(T, X, T2), !.
gt([_|T], X, T2) :-
    gt(T, X, T2).
