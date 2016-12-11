% Write a predicate to determine if a list has even numbers of
% elements without counting the elements from the list.

% has_even_length(L:list)
% flow model: (i)
% returns true if L has an even number of elements, false otherwise
has_even_length(L) :-
	has_even_length(L, 0).

% has_even_length(L:list, F:int)
% flow model: (i i)
% F is a flag
has_even_length([], 0).
has_even_length([_|T], 0) :-
	has_even_length(T, 1), !.
has_even_length([_|T], 1) :-
	has_even_length(T, 0).
% FALSE, otherwise
