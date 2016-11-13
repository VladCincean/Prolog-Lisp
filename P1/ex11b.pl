% Write a predicate to create the sublist (lm, …, ln) from the list (l1,…, lk).

% sublist(L:list, M:int, N:int, R:list)
% flow model: (i i i o), (i i i i)
sublist([], _, _, []).
sublist([_|T], M, N, Tr) :-
	M > 1,
	M1 is M - 1,
	N1 is N - 1,
	sublist(T, M1, N1, Tr).
sublist([H|T], M, N, [H|Tr]) :-
	M =< 1,
	N > 0,
	M1 is M - 1,
	N1 is N - 1,
	sublist(T, M1, N1, Tr).
sublist([_|T], M, N, Tr) :-
	N < 1,
	M1 is M - 1,
	N1 is N - 1,
	sublist(T, M1, N1, Tr).

