% Write a predicate to remove all occurrences of a certain atom from a list.

% remove_atom(L-list, E-atom, R-list)
% R = the list obtained by removing all occurrences of E in the list L
% flow model: (i i o) (i i i)
remove_atom([], _, []).
remove_atom([H|T], E, Tr) :-
	%H =:= E,
	H = E,
	remove_atom(T, E, Tr).
remove_atom([H|T], E, [H|Tr]) :-
	%H =\= E,
	H \= E,
	remove_atom(T, E, Tr), !.

% ------------------------------------------------------------------------
% Define a predicate to produce a list of pairs (atom n) from an
% initial list of atoms. In this initial list atom has n occurrences.
% Eg.: numberatom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2, 2], [3, 1]].

% nr_occ(L:list, E:int, N:int)
% flow model: (i i o), (i i i)
% N = the number of occurences of atom E in the list L
nr_occ([], _, 0).
nr_occ([H|T], E, N) :-
	H = E,
	nr_occ(T, E, N1),
	N is N1 + 1,
	!.
nr_occ([H|T], E, N) :-
	H \= E,
	nr_occ(T, E, N).

% set(L:list, S:list)
% flow model: (i o), (i i)
% S = the set obtained from the list L
set([], []).
set([H|T], [H|Tr]) :-
	remove_atom(T, H, S1),
	set(S1, Tr).

% numberatom(L:list, X:list)
% flow model: (i o), (i i)
% X is a list of pairs [atom, n], where 'n' is the number of occurences
% of 'atom' in the initial list L
numberatom(L, X) :-
	set(L, S),
	numberatom(L, S, X).

% numberatom(L:list, S:list, X:list)
% flow model: (i i o), (i i i)
% auxiliary predicate (here S is the set obtained from list L)
numberatom(_, [], []).
numberatom(L, [Hs|Ts], [[Hs,N]|Tx]) :-
	nr_occ(L, Hs, N),
	numberatom(L, Ts, Tx).
