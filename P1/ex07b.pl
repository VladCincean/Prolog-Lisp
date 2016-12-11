% Write a predicate to create a list (m, ..., n) of all integer
% numbers from the interval [m, n].

% ft_ultimate_range(M:int, B:int, R:list)
% flow model: (i i o), (i i i)
% R = [m, m + 1, ..., n]
ft_ultimate_range(M, N, []) :-
	M > N.
ft_ultimate_range(M, N, [M|Tr]) :-
	M =< N,
	M1 is M + 1,
	ft_ultimate_range(M1, N, Tr).

