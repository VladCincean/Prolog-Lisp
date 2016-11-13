% Write a predicate to determine the set of all the pairs of elements in a list.
% Eg.: L = [a b c d] => [[a b] [a c] [a d] [b c] [b d] [c d]].

% append(L1:list, L2:list, R:list)
% flow model: (i i o), (i i i)
% R = the list obtained by appending L2 to L1
append([], [], []).
append([H1|T1], L2, [H1|Tr]) :-
	append(T1, L2, Tr).
append([], [H2|T2], [H2|Tr]) :-
	append([], T2, Tr).

% pairs(E:atom, L:list, R:llist)
% flow model: (i i o), (i i i)
% R is the list of all pairs [E, Lk], for all Lk elements of list L
pairs(_, [], []).
pairs(E, [H|T], [[E,H]|Tr]) :-
	pairs(E, T, Tr).

% pairs(L:list, R:llist)
% flow model: (i o), (i i)
% R is the set of all the pairs of elements in the list L
pairs([], []).
pairs([H|T], R) :-
	pairs(H, T, Hr),
	pairs(T, Tr),
	append(Hr, Tr, R).
