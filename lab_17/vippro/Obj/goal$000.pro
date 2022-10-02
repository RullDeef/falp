domains
	num = integer
	elemList = num*

predicates
	length(num, elemList).
	sum(num, elemList).
	sum_odd_id(num, elemList).

clauses
	length(0, []) :- !.
	length(R, [_|T]) :-
		length(R_1, T),
		R = R_1 + 1.
	
	sum(0, []) :- !.
	sum(R, [R]) :- !.
	sum(R, [H|T]) :-
		sum(R1, T),
		R = H + R1.
	
	sum_odd_id(0, []) :- !.
	sum_odd_id(0, [_]) :- !.
	sum_odd_id(R, [_, R]) :- !.
	sum_odd_id(R, [_, H|T]) :-
		sum_odd_id(R1, T),
		R = R1 + H.

goal
	sum_odd_id(R, [1, 2, 3, 4, 5]).