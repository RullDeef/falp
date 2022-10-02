is_even(0) :- !.
is_even(X) :- X > 0, Y is X - 2, is_even(Y).

is_odd(1) :- !.
is_odd(X) :- X > 1, Y is X - 2, is_odd(Y).

all_simple(_, []) :- !.
all_simple(X, [Head|Tail]) :-
    Y is X mod Head, Y \= 0,
    Z is Head mod X, Z \= 0,
    all_simple(X, Tail).

create_num_list(1, []) :- !.
create_num_list(X, [X|Res]) :-
    X > 1,
    Y is X - 1,
    create_num_list(Y, Res).

is_prime(1) :- !.
is_prime(X) :-
    create_num_list(X, [_|NumLst]),
    all_simple(X, NumLst).

get_primes_upto(1, []) :- !.
get_primes_upto(X, [X|Res]) :-
    is_prime(X),
    Y is X - 1,
    get_primes_upto(Y, Res), !.
get_primes_upto(X, Res) :-
    Y is X - 1,
    get_primes_upto(Y, Res).

add_before(_, [], []) :- !.
add_before(X, [H|T], [[X, H]|R]) :- add_before(X, T, R).

% [1 2] x [3 4] = [[1 3] [1 4] [2 3] [2 4]]
decart(_, [], []) :- !.
decart([], _, []) :- !.
decart([A], [B], [[A, B]]) :- !.
decart([A|Ta], [B|Tb], Res) :-
    add_before(A, [B|Tb], CurRes),
    decart(Ta, [B|Tb], NxtRes),
    append(CurRes, NxtRes, Res).

add_before_lst(_, [], []) :- !.
add_before_lst(X, [H|T], [[X|H],R]) :- add_before_lst(X, T, R). 

all([], _) :- !.
all([H|T], F) :- call(F, H), all(T, F).

any([H|T], F) :- call(F, H), !; any(T, F).

map([], _, []) :- !.
map([H|T], F, [V|R]) :- call(F, H, V), map(T, F, R).

filter([], _, []) :- !.
filter([H|T], Func, [H|Res]) :-
    call(Func, H),
    filter(T, Func, Res), !.
filter([_|T], Func, Res) :- filter(T, Func, Res).

reduce([X,Y], F, R) :- call(F, X, Y, R), !.
reduce([H|T], F, R) :- reduce(T, F, R1), call(F, H, R1, R).

square(X, R) :- R is X * X.

sum(A, B, R) :- R is A + B.

n_dup(X, 1, [X]) :- !.
n_dup(X, N, [X|R]) :- K is N - 1, n_dup(X, K, R).

zero_mat(1, [[0]]) :- !.
zero_mat(N, M) :-
    n_dup(0, N, Row),
    n_dup(Row, N, M).

as --> [a].
as --> [a], as.
