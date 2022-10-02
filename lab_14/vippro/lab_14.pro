domains
	name = symbol
	nameList = name*

predicates
	father(name, name).
	mother(name, name).

	parent(name, name).
	grandfather(name, name).
	grandmother(name, name).
	grandparent(name, name).
	
	allgrandfathers(name, nameList).
	allgrandmothers(name, nameList).
	allgrandparents(name, nameList).

	grandmothermline(name, name).
	grandparentsmline(name, name GrandmFather, name GrandMother).

clauses
	father(ivan, petya).
	father(petya, vasya).
	father(nastya, grisha).

	mother(ivan, nastya).
	mother(petya, lera).
	mother(nastya, masha).
	
	parent(X, Y) :- 	father(X, Y); mother(X, Y).
	grandfather(X, Y) :- 	parent(X, Z), father(Z, Y).
	grandmother(X, Y) :- 	parent(X, Z), mother(Z, Y).
	grandparent(X, Y) :-	parent(X, Z), parent(Z, Y).
	
	allgrandfathers(X, L) :- findall(Name, grandfather(X, Name), L).
	allgrandmothers(X, L) :- findall(Name, grandmother(X, Name), L).
	allgrandparents(X, L) :- findall(Name, grandparent(X, Name), L).
	
	grandmothermline(X, Y) 	:- mother(X, Z), mother(Z, Y).
	grandparentsmline(X, GF, GM) :- mother(X, M), father(M, GF), mother(M, GM).

goal
	grandparentsmline(ivan, GF, GM).