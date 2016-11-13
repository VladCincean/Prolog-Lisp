% Calculate the alternate sum of list’s elements (l1 - l2 + l3 ...).

% alt_sum(L:list, S:int)
% flow model: (i o), (i i)
% S = l1 - l2 + l3 - ... + (-1)^(n+1)*ln
alt_sum(L, S) :-
	alt_sum(L, 1, S).

% alt_sum(L:list, Sign:int, S:int)
% flow model: (i o), (i i)
alt_sum([], _, 0).
alt_sum([H|T], Sign, S) :-
	Sign2 is Sign * (-1),
	alt_sum(T, Sign2, St),
	S is Sign * H + St.
