domains
	name = symbol
	nameList = name*

predicates
	mother_nth(Res, Name, 0) :- mother(Res, Name), !.
	mother_nth(Res, Name, N) :-
		mother(Tmp, Name),
		Nm1 = N - 1,
		mother_nth(Res, Tmp, Nm1).

clauses

goal
