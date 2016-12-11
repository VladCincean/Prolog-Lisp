% Define a predicate to determine the greatest common divisor of all numbers from a list.

% gcd(A:int, B:int, D:int)
% flow model: (i i o), (i i i)
% D = gcd(A, B)
gcd(A, B, D) :-
	A < 0, !,
	A1 is -A,
	gcd(A1, B, D).
gcd(A, B, D) :-
	B < 0, !,
	B1 is -B,
	gcd(A, B1, D).
gcd(A, 0, A) :- !.
gcd(0, B, B) :- !.
gcd(A, B, D) :-
	A =< B, !,
	C is B mod A,
	gcd(A, C, D).
gcd(A, B, D) :-
	gcd(B, A, D).

% gcd_list(L:list, D:int)
% flow model: (i o), (i i)
% D = gcd(L)
gcd_list([E], E).
gcd_list([H1,H2|T], D) :-
	gcd(H1, H2, D12),
	gcd_list([D12|T], D).
