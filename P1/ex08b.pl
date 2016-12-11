% Write a predicate to delete first occurrence of the minimum number from a list.

% minimum(L:list, E:int)
% flow model: (i o), (i i)
% E = min(L)

minimum([E], E).
minimum([H1,H2|T], E) :-
	H1 =< H2,
	minimum([H1|T], E).
minimum([H1,H2|T], E) :-
	H2 < H1,
	minimum([H2|T], E).

% delete_first(L:list, E:elem, R:list)
% flow model: (i i o), (i i i)
% R = the list obtained by removing the first occurence of E from L
delete_first([], _, []).
delete_first([E|T], E, T).
delete_first([H|T], E, [H|Tr]) :-
	H \= E,
	delete_first(T, E, Tr).

% delete_first_min(L:list, R:list)
% flow model: (i o), (i i)
% R = the list obtained by removing the 1st occurence of min(L)
delete_first_min([], []).
delete_first_min(L, R) :-
	minimum(L, Min),
	delete_first(L, Min, R).
