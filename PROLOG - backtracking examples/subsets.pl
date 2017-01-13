% Subsets
% -------
% If the list is empty, a subset of it is the empty list
% Generating the subsets of the list [E|L]:
%     i) generate a subset of the list L
%     ii) put E on the first position in a subset of L


% subset(L:list, R:list)
% flow model: (i o), (i i)
subset([], []).
subset([_|L], R) :-
	subset(L, R).
subset([E|L], [E|R]) :-
	subset(L, R).

% subsets(L:list, R:llist)
% flow mode: (i o), (i i)
subsets(L, R) :-
	findall(X, subset(L, X), R).

% subsets of sum S
% ----------------

% subset(L:list, S:int, R:list)
% flow model: (i i o), (i i i)
subset([], 0, []).
subset([_|L], S, R) :-
	subset(L, S, R).
subset([E|L], S, [E|R]) :-
	E =< S,
	S1 is S - E,
	subset(L, S1, R).

% subsets(L:list, S:int, R:llist)
subsets(L, S, R) :-
	findall(X, subset(L, S, X), R).
