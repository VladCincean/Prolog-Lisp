% Sort a list with keeping double values in resulted list.
% E.g.: [4 2 6 2 3 4] --> [2 2 3 4 4 6]

% insert(E:int, L:list, R:list)
% flow model: (i i o), (i i i)
insert(E, [], [E]).
insert(E, [H|T], [E|Tr]) :-
	E =< H,
	insert(H, T, Tr).
insert(E, [H|T], [H|Tr]) :-
	E > H,
	insert(E, T, Tr).

% insertion_sort(L:list, R:list)
% flow model: (i o), (i i)
insertion_sort([], []).
insertion_sort([H|T], R) :-
	insertion_sort(T, Rt),
	insert(H, Rt, R).

% my_sort(L:list, R:list)
% flow model: (i o), (i i)
my_sort(L, R) :-
	insertion_sort(L, R).
