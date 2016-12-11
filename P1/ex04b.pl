% Write a predicate to add value 1 after every even element from a list.

% add_1_after_evens(L:list, R:list)
% flow model: (i o), (i i)
% R = the list obtained by adding value	1 after every even elem. from L
add_1_after_evens([], []).
add_1_after_evens([H|T], [H,1|Tr]) :-
	0 is H mod 2,
	add_1_after_evens(T, Tr).
add_1_after_evens([H|T], [H|Tr]) :-
	1 is H mod 2,
	add_1_after_evens(T, Tr).
