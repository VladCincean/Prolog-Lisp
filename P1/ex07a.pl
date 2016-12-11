% Write a predicate to compute the intersection of two sets.

% my_member(E:atom, L:list)
% flow model: (i i), (o i)
% returns true if E is a member of L, and false otherwise
my_member(E, [E]).
my_member(E, [E|_]).
my_member(E, [_|T]) :-
	my_member(E, T).

% intersection(A:list, B:list, C:list)
% flow model: (i i o), (i i i)
% C = intersection of the sets A and B
intersection([], [], []).
intersection([], _, []).
intersection([Ha|Ta], B, [Ha|Tc]) :-
	my_member(Ha, B),
	intersection(Ta, B, Tc).
intersection([Ha|Ta], B, Tc) :-
	not(my_member(Ha, B)),
	intersection(Ta, B, Tc).
