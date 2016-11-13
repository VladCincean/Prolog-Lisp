% Insert an element on the position n in a list.

% insert_at(L:list, N:int, E:elem, R:list)
% flow model: (i i i o), (i i i i)
%insert_at(L, N, _, L) :-
	%N < 1.
insert_at(L, 1, E, [E|L]) :- !.
insert_at([], _, _, []).
insert_at([H|T], N, E, [H|Tr]) :-
	%N > 0,
	N1 is N - 1,
	insert_at(T, N1, E, Tr).
