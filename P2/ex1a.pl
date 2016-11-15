% Sort a list with removing the double values.
% E.g.: [4 2 6 2 3 4] --> [2 3 4 6]

% remove_elem(E:atom, L:list, R:list)
% flow model: (i i o), (i i i)
remove_elem(_, [], []).
remove_elem(E, [E|T], R) :-
	remove_elem(E, T, R).
remove_elem(E, [H|T], [H|R]) :-
	E \= H,
	remove_elem(E, T, R).

% set(L:list, R:list)
% flow model: (i o), (i i)
set([], []).
set([H|T], [H|X]) :-
	remove_elem(H, T, Y),
	set(Y, X).

% insert(E:int, L:list, R:list
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

% sort_with_removing_doubles(L:list, R:list)
% flow model: (i o), (i i)
sort_with_removing_doubles([], []).
sort_with_removing_doubles(L, R) :-
	set(L, S),
	insertion_sort(S, R).

