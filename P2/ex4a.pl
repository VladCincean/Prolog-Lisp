% Write a predicate to determine the sum of two numbers written
% in list representation.

% my_append(L:list, E:atom, R:list)
% flow model: (i i o), (i i i)
my_append([], E, [E]).
my_append([H|T], E, [H|R]) :-
	my_append(T, E, R).

% my_reverse(L:list, R:list)
% flow model: (i o), (i i)
my_reverse([], []).
my_reverse([H|T], R) :-
	my_reverse(T, Rt),
	my_append(Rt, H, R).

% compute(L1:list, L2:list, C:int, R:list)
% flow model: (i o), (i i)
% L1, L2 - 2 numbers, C - carry, R - result
compute([], [], 0, []).
compute([], [], 1, [1]).
compute([A|T], [], 0, [A|R]) :-
	compute(T, [], 0, R).
compute([A|T], [], 1, [B|R]) :-
	B is A + 1,
	B < 10,
	compute(T, [], 0, R).
compute([A|T], [], 1, [0|R]) :-
	10 is A + 1,
	compute(T, [], 1, R).
compute([], [A|T], 0, [A|R]) :-
	compute(T, [], 0, R).
compute([], [A|T], 1, [B|R]) :-
	B is A + 1,
	B < 10,
	compute([], T, 0, R).
compute([], [A|T], 1, [0|R]) :-
	10 is A + 1,
	compute([], T, 1, R).
compute([H1|T1], [H2|T2], 0, [S|T]) :-
	S is H1 + H2,
	S < 10,
	compute(T1, T2, 0, T).
compute([H1|T1], [H2|T2], 1, [S|T]) :-
	S is H1 + H2 + 1,
	S < 10,
	compute(T1, T2, 0, T).
compute([H1|T1], [H2|T2], 0, [S|T]) :-
	S1 is H1 + H2,
	S1 >= 10,
	S is S1 - 10,
	compute(T1, T2, 1, T).
compute([H1|T1], [H2|T2], 1, [S|T]) :-
	S1 is H1 + H2 + 1,
	S1 >= 10,
	S is S1 - 10,
	compute(T1, T2, 1, T).

% my_sum(L1:list, L2:list, R:list)
% flow model: (i i o), (i i i)
my_sum(L1, L2, R) :-
	my_reverse(L1, LR1),
	my_reverse(L2, LR2),
	compute(LR1, LR2, 0, R1),
	my_reverse(R1, R).
