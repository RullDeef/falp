type(eq).
type(ord).
type(enum).
type(num).
type(real).
type(fractional).
type(realfrac).
type(integral).
type(floating).
type(bool).

% (a, b) == a -> b
inherits(num, eq).
inherits(bool, eq).
inherits(real, ord).
inherits(real, num).
inherits(fractional, num).
inherits(realfrac, real).
inherits(realfrac, fractional).
inherits(integral, enum).
inherits(integral, realfrac).
inherits(floating, fractional).

instance(Num, integral) :- integer(Num).
instance(Num, floating) :- float(Num).
instance(true, bool).
instance(false, bool).

constraint(X, X) :-
    type(X), !.
constraint(X, Class) :-
    inherits(X, Class), !.
constraint(X, Class) :-
    inherits(X, Y),
    constraint(Y, Class), !.
constraint(X, Class) :-
    instance(X, Class), !.
constraint(X, Class) :-
    instance(X, Y),
    constraint(Y, Class), !.

% operaetor(Name, In, Out)
operator('+', [X, X], X) :-
    constraint(X, num), !.
operator('-', [X, X], X) :-
    constraint(X, num), !.
operator('/', [X, X], X) :-
    constraint(X, floating), !.
operator(not, [bool], bool) :- !.
operator('<', [X, X], bool) :-
    constraint(X, ord), !.
operator('==', [X, X], bool) :-
    constraint(X, eq), !.
operator('?', [X, Y, Y], Y) :-
    constraint(X, bool),
    type(Y), !.

map([], _, []) :- !.
map([Res|RT], Pred, [Lst|LT]) :-
    call(Pred, Res, Lst),
    map(RT, Pred, LT).

% hm(Expr, Type)
hm(Out, [Fn|Input]) :-
    map(InputTypes, hm, Input),
    operator(Fn, InputTypes, Out), !.
hm(Type, [Value]) :-
    constraint(Value, Type), !.
hm(Type, Value) :-
    constraint(Value, Type), !.

test([T1, T2, T3]) :-
    hm(T1, ['+', 20, 30]),
    hm(T2, ['?', [not, ['<', 3, 2]], 10.4, 13.2]),
    hm(T3, ['==', true, [not, ['==', 13.2, -2.3]]]).
