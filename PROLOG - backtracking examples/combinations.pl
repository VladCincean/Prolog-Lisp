% Combinations
% ------------
% Generating the combinations of N elements of the list [E|L]
% * If N = 1, a possible combination is [E]
% * Generate a combination of N elements of the list L
% * Put E on the first position in a combination of N - 1 elements of L

% comb(L:list, N:int, R:list)
% flow model: (i i o), (i i i)

comb([E|_], 1, [E]).
comb([_|L], N, R) :-
	comb(L, N, R).
comb([A|L], N, [A|R]) :-
	N =\= 1,
	N1 is N - 1,
	comb(L, N1, R).

combinations(L, N, R) :-
	findall(X, comb(L, N, X), R).
