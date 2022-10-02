stack_push(L, X, [X|L]).
stack_pop(L, X, Res) :- stack_push(Res, X, L).

stack_empty([]).

filter_even([], []).
filter_even([Head|Tail], Res) :-
    V is Head mod 2, V = 0, 
    filter_even(Tail, NewRes),
    Res = [Head|NewRes], !.
filter_even([Head|Tail], Res) :-
    V is Head mod 2, V = 1,
    filter_even(Tail, Res).

map_sqr([], []).
map_sqr([Head|Tail], [V|ResTail]) :-
    V is Head * Head,
    map_sqr(Tail, ResTail).

reduce_sum([], 0).
reduce_sum([Head|Tail], Res) :-
    reduce_sum(Tail, NewRes),
    Res is NewRes + Head.

contains([X|_], X) :- !.
contains([Head|Tail], X) :- Head \= X, contains(Tail, X).

% S1 входит в S2
set_included([], []).
set_included([Head|Tail], S2) :-
    contains(S2, Head),
    set_included(Tail, S2).

set_equal(S1, S2) :-
    set_included(S1, S2),
    set_included(S2, S1).

list_rev([], []).
list_rev([Head|Tail], Res) :-
    list_rev(Tail, NewRes),
    append(NewRes, [Head], Res).

is_palindrome(Lst) :- list_rev(Lst, Lst).
