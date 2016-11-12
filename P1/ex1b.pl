% Write a predicate to add a value v after 1st, 2nd, 4th, 8th, … element in a list.

% power_of_two(N:int)
% check if N is a power of 2 or not
% flow model: (i)
power_of_two(1) :- !.
power_of_two(N) :-
	integer(N),
	N > 0,
	N1 is N / 2,
	power_of_two(N1).

% add_v(L:list, V:int, R:list)
% R = list obtained by adding value V after every power-of-two-position
% in the initial list L
% flow model: (i i o), (i i i)
add_v(L, V, R) :-
	add_v(L, V, 1, R),
	write(R).

% add_v(L:list, V:int, I:int, R:list)
% auxiliary predicate used to keep track of the indices
% flow model: (i i i o), (i i i i)
add_v([], _, _, []).
add_v([E], _, I, [E]) :-
	not(power_of_two(I)).
add_v([E], V, I, [E, V]) :-
	power_of_two(I), !.
add_v([H|T], V, I, [H|Tr]) :-
	not(power_of_two(I)),
	I1 is I + 1,
	add_v(T, V, I1, Tr).
add_v([H|T], V, I, [H,V|Tr]) :-
	power_of_two(I),
	I1 is I + 1,
	add_v(T, V, I1, Tr), !.
