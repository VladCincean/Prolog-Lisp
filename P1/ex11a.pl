% Write a predicate to substitute an element from a list with
% another element in the list.

% substitute(L:list, What:atom, With:atom, R:list)
% flow model: (i i i o), (i i i i)
% R = the list obtained by substituting 'What' with 'With' in 'L'
substitute([], _, _, []).
substitute([What|T], What, With, [With|Tr]) :-
	substitute(T, What, With, Tr).
substitute([H|T], What, With, [H|Tr]) :-
	H \= What,
	substitute(T, What, With, Tr).
