% pairs [A, B]: A < B
% -----
% [l1 l2 ... ln] -> [li lj], i < j
% * a pair of [l2 ... ln]
% * a pair of [l1 ... X], X from [l2 ... ln]

% pair(list, list)
pair([_|L], X) :-
	pair(L, X).
pair([A|L], X) :-
	pair2(A, L, X).

% pair2(atom, list, list)
pair2(A, [B|_], [A, B]) :-
	A < B.
pair2(A, [_|L], X) :-
	pair2(A, L, X).

% all_pairs(list, llist)
all_pairs(L, R) :-
	findall(X, pair(L, X), R).
