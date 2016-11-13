% Write a predicate to determine the difference of two sets.

% my_member(E:atom, L:list)
% flow model: (i i), (o i)
% returns true if E is a member of L, and false otherwise
my_member(E, [E]).
my_member(E, [E|_]).
my_member(E, [_|T]) :-
	my_member(E, T).

% diff(A:list, B:list, C:list)
% flow model: (i i o), (i i i)
% C = A \ B, where A and B are sets
diff([], _, []).
diff([HA|TA], B, [HA|TC]) :-
	not(my_member(HA, B)),
	diff(TA, B, TC).
diff([HA|TA], B, TC) :-
	my_member(HA, B),
	diff(TA, B, TC).
