domains

	address = address(symbol City, symbol Street, integer HouseNum, integer AppartNum).
	property =
		car(symbol Mark, integer Cost);
		building(symbol Name, integer Cost);
		sector(symbol Name, integer Cost);
		ship(symbol Name, integer Cost).
	integerList = integer*.

predicates

	telephone(symbol Surname, symbol TelNum, address).
	car(symbol Surname, symbol Mark, symbol Color, integer Cost).
	account(symbol Surname, symbol Bank, symbol AccNum, integer Cash).

	own(symbol Surname, property).
	getOwningInfo(symbol Surname, symbol Name, integer Cost).
	
	getListSum(integerList, integer Sum).
	getTotalCost(symbol Surname, integer Cost).

clauses

	telephone(ivanov,   "+79162694425", address(smolensk, baumanskaya,   9, 38)).
	telephone(sidorov,  "+79578163207", address(moscow,   pushkinskaya, 69, 29)).
	telephone(petrova,  "+79690758483", address(omsk,     lermontova,   65,  6)).
	telephone(sidorova, "+79917012024", address(omsk,     baumanskaya,  82, 79)).
	telephone(petrova,  "+79533641292", address(moscow,   leninskaya,   33, 79)).

	car(petrov,   shkoda, white,  900000).
	car(petrova,  hynday, blue,   720000).
	car(sidorova, shkoda, gray,   900000).
	car(ivanova,  opel,   black,  800000).
	car(sidorov,  hynday, gray,  1000000).

	account(ivanova,  alphabank, a2394, 71000).
	account(ivanov,   tinkoff,   a0064, 10000).
	account(sidorov,  sberbank,  a0020, 48000).
	account(sidorova, sberbank,  a3564, 85000).
	account(petrov,   tinkoff,   a5992, 81000).

	own(ivanov,  building(house1, 1800000)).
	own(ivanova, building(house2, 1900000)).
	own(petrova, building(house3, 1000000)).
	own(sidorov, building(house4, 1100000)).
	own(petrov,  building(house5, 1200000)).

	own(sidorova, sector(sector1, 490000)).
	own(petrov,   sector(sector2, 480000)).
	own(ivanova,  sector(sector3, 470000)).
	own(invanov,  sector(sector4, 460000)).
	own(petrova,  sector(sector5, 450000)).

	own(Surname, car(Mark, Cost)) :-
		car(Surname, Mark, _, Cost).

	getOwningInfo(Surname, Name, Cost) :-
		own(Surname, car(Name, Cost));
		own(Surname, building(Name, Cost));
		own(Surname, sector(Name, Cost)).
	
	getListSum([], 0) :- !.
	getListSum([Res], Res) :- !.
	getListSum([Head,Next|Tail], Res) :-
		TmpRes = Head + Next,
		getListSum([TmpRes|Tail], Res).

	getTotalCost(Surname, TotalCost) :-
		findall(Cost, getOwningInfo(Surname, _, Cost), CostList),
		getListSum(CostList, TotalCost).

goal

	%1 getOwningInfo(petrov, Name, _).
	getOwningInfo(petrov, Name, Cost).
	%3 getTotalCost(sidorov, TotalCost).