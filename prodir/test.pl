% insert in pos

insert_list(Lst, 0, Val, [Val|Lst]).
insert_list([Head|Tail], Pos, Val, Res) :-
    insert_list(Tail, NewPos, Val, NewRes),
    Pos is NewPos + 1,
    Res = [Head|NewRes].

append_to_list([],X,[X]).
append_to_list([Head|Tail],X,Res) :-
    append_to_list(Tail,X,NewRes), Res = [Head|NewRes].

delete_from_list([],_,[]).
delete_from_list([X|Tail],X,Tail).
delete_from_list([Head|Tail],X,[Head|Res]) :-
    Head \= X, delete_from_list(Tail,X,Res).
