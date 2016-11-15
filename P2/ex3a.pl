% Merge two sorted lists with removing the double values.

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

% merge(L1:list, L2:list, R:list)
% flow model: (i i o), (i i i)
merge([], L2, L2).
merge(L1, [], L1).
merge([H1|T1], [H2|T2], [H1|T]) :-
	H1 =< H2,
	merge(T1, [H2|T2], T).
merge([H1|T1], [H2|T2], [H2|T]) :-
	H1 > H2,
	merge([H1|T1], T2, T).

% merge_with_removing_doubles(L1:list, L2:list, R:list)
merge_with_removing_doubles(L1, L2, R) :-
	merge(L1, L2, R1),
	set(R1, R).
