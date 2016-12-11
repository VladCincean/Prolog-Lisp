% Define a predicate to remove from a list all repetitive elements.
% Eg.: l = [1, 2, 1, 4, 1, 3, 4] => l = [2, 3]

% remove_atom(L:list, E:atom, R:list)
% flow model: (i i o), (i i i)
% R = the list obtained by removing E from L
remove_atom([], _, []).
remove_atom([H|T], E, Tr) :-
	H = E,
	remove_atom(T, E, Tr).
remove_atom([H|T], E, [H|Tr]) :-
	H \= E,
	remove_atom(T, E, Tr),
	!.

% nr_occ(L:list, E:atom, N:int)
% flow model: (i i o), (i i i)
% N = the number of occurences od E in the list L
nr_occ([], _, 0).
nr_occ([H|T], E, N) :-
	H \= E,
	nr_occ(T, E, N),
	!.
nr_occ([H|T], E, N) :-
	H = E,
	nr_occ(T, E, N1),
	N is N1 + 1.

% remove_all_repetitives(L:list, R:list)
% flow model: (i o), (i i)
% R = the list obtained from L by removing all repetitive elements
remove_all_repetitives([], []).
remove_all_repetitives([H|T], Tr) :-
	nr_occ([H|T], H, N),
	N > 1,
	remove_atom([H|T], H, R),
	remove_all_repetitives(R, Tr),
	!.
remove_all_repetitives([H|T], [H|Tr]) :-
	nr_occ([H|T], H, N),
	N =:= 1,
	remove_all_repetitives(T, Tr).
