:- dynamic(prime/1).

prime(X, X) :- !.
prime(X, I) :-
    Rest is X mod I, Rest \= 0,
    Inext is I + 1,
    prime(X, Inext).

prime(X) :- prime(X, 2), asserta(prime(X)), !.

factorize(1, []) :- !.
factorize(X, [N|R]) :-
    Y #> 0, Y #< X, X #= Y * N, prime(N),
    factorize(Y, R).
