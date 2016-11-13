% Write a predicate to compute the union of two sets.

% append(L1:list, L2:list, R:list)
% flow model: (i i o), (i i i)
% R = the list obtained by appending L2 to L1
append([], [], []).
append([H1|T1], L2, [H1|Tr]) :-
	append(T1, L2, Tr).
append([], [H2|T2], [H2|Tr]) :-
	append([], T2, Tr).

% remove_atom(L:list, E:atom, R:list)
% flow model: (i i o), (i i i)
% R = the list obtained from L by removing E
remove_atom([], _, []).
remove_atom([E|T], E, Tr) :-
	remove_atom(T, E, Tr).
remove_atom([H|T], E, [H|Tr]) :-
	H \= E,
	remove_atom(T, E, Tr).

% set(L:list, S:list)
% flow model: (i o), (i i)
% S = the set obtained from L
set([], []).
set([H|T], [H|Tr]) :-
	remove_atom(T, H, S),
	set(S, Tr),
	!.

% union(A:list, B:list, C:list)
% flow model: (i i o), (i i i)
% C = A U B, where A and B are sets
union(A, B, C) :-
	append(A, B, AB),
	set(AB, C).
