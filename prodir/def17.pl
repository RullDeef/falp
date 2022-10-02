insert_head([], _, []) :- !.
insert_head([[NewH|H]|RT], NewH, [H|T]) :- insert_head(RT, NewH, T).

all_subsets([], []) :- !.
all_subsets([[El], []], [El]) :- !.
all_subsets(R, [H|T]) :- all_subsets(R1, T), append([H|R1], R1, R).


is_total_sublist([H], [H|_]).
is_total_sublist([H|RT], [H|T]) :- is_total_sublist(RT, T).

is_sublist([H], [H|_]).
is_sublist([H|RT], [H|T]) :- is_total_sublist(RT, T).
is_sublist(R, [_|T]) :- is_sublist(R, T).

all_sublists([[]], []) :- !.
all_sublists([[]|R], L) :- findall(S, is_sublist(S, L), R).


my_reverse([], X, X) :- !.
my_reverse([H1|T1], T, X) :- my_reverse(T1, [H1|T], X).
