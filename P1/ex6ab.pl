% Write a predicate to test if a list is a set.

% nr_occ(L:list, E:atom, N:int)
% flow model: (i i o), (i i i)
% N = the nr. of occurences of E in L
nr_occ([], _, 0).
nr_occ([E|T], E, N) :-
	nr_occ(T, E, N1),
	N is N1 + 1.
nr_occ([H|T], E, N) :-
	H \= E,
	nr_occ(T, E, N).

% is_set(L:list)
% flow model: (i)
% returns true if list L is a set, and false otherwise
is_set([]).
is_set([H|T]) :-
	nr_occ(T, H, N),
	0 is N,
	is_set(T).

% ------------------------------------------------------------------------
% Write a predicate to remove the first three occurrences of an element
% in a list. If the element occurs less than three times, all
% occurrences will be removed.

% TBD
