% maximum_value(L:list, M:int)
% flow model: (i o), (i i)
% M is the maximum value from the non-empty list L of integer numbers
maximum_value([E], E) :- !.
maximum_value([H1,H2|T], M) :-
	H1 >= H2,
	maximum_value([H1|T], M),
        !.
maximum_value([H1,H2|T], M) :-
	H2 > H1,
	maximum_value([H2|T], M).

% remove_atom(L:list, A:atom, R:list)
% flow model: (i i o), (i i i)
% R = the list obtained by removing atom A from list L
remove_atom([], _, []).
remove_atom([H|T], E, Tr) :-
	H = E,
	remove_atom(T, E, Tr),
	!.
remove_atom([H|T], E, [H|Tr]) :-
	H \= E,
	remove_atom(T, E, Tr).

% remove_max_val(L:list, R:list)
% flow model: (i o), (i i)
% R = the list obtained by removing the maximum value from L
remove_max_val([], []).
remove_max_val(L, R) :-
	maximum_value(L, M),
	remove_atom(L, M, R).
