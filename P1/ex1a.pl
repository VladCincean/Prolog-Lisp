% Write a predicate to determine the lowest common multiple
% of a list formed from integer numbers.

% gcd(A:int, B:int, D:int)
% D = the greatest common divisor of A and B
% flow model: (i i o), (i i i)
gcd(A, B, N) :-
	A < 0, !,
	A1 is -A,
	gcd(A1, B, N).
gcd(A, B, N) :-
	B < 0, !,
	B1 is -B,
	gcd(A, B1, N).
gcd(N, 0, N) :- !.
gcd(0, N, N) :- !.
gcd(A, B, D) :-
	A =< B, !,
	C is B - A,
	gcd(A, C, D).
gcd(A, B, D) :-
	gcd(B, A, D).

% lcm(A:int, B:int, M:int)
% M = the lowest common multiple of A and B
% flow model: (i i o), (i i i)
% lcm(A, B) = A * B / gcd(A, B)
lcm(A, B, M) :-
	gcd(A, B, D),
	M is A * B / D.

% lcm_list(L:list, R:int)
% R = the lowest common multiple of the list L
% flow model: (i o), (i i)
lcm_list([], 0).
lcm_list([E], E):- !.
lcm_list([H|T], R) :-
	lcm_list(T, Rt),
	lcm(H, Rt, R).
