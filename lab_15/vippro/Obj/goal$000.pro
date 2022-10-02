domains
	num = integer
	numList = integer*

predicates
	max(num, num, num).
	max(num, num, num, num).
	max(num, numList).

clauses
	max(A, A, B) :- A >= B.
	max(B, _, B).
	
	max(A, A, B, C) :- A >= B, A >= C.
	max(B, _, B, C) :- B >= C.
	max(C, _, _, C).
	
	max(A, [A]) :- !.
	max(A, [A, B]) :- A >= B, !.
	max(B, [_, B]) :- !.
	max(R, [A|T]) :- max(R1, T), max(R, A, R1).

goal
	max(R, [1, 3, 5, 2, 7, 0]).	