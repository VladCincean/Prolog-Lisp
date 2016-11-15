% distance(A:int, B:int, D:int)
% flow model: (i i o), (i i i)
% computes D = |B - A|
distance(A, B, D) :-
	B > A,
	D is B - A, !.
distance(A, B, D) :-
	A >= B,
	D is A - B.

% candidate(A:int)
% flow model: (o), (i)
% A valid candidate is 0, 1 or -1
candidate(0).
candidate(1).
candidate(-1).

% check_distance(Ai:int, Ai1:int)
% flow model: (i i)
% check if |A(i+1) - A(i)| = 1 or 2
check_distance(A1, A2) :-
	distance(A1, A2, 1), !.
check_distance(A1, A2) :-
	distance(A1, A2, 2).

% my_append(L:list, E:atom, R:list)
% flow model: (i i o), (i i i)
my_append([], E, [E]).
my_append([H|T], E, [H|R]) :-
	my_append(T, E, R).

% my_reverse(L:list, R:list)
% flow model: (i o), (i i)
% R is L reversed
my_reverse([], []).
my_reverse([H|T], R) :-
	my_reverse(T, Rt),
	my_append(Rt, H, R).

% generate(N:int, C:list, LenC:int, R:list)
% flow model: (i i i o), (i i i i)
% N - "n" from the size of the array
% C - candidate list; construct the result progresively
% LenC - length(C)
% R - final result
generate(N, [HC|TC], LenC, R) :-
	LenC =:= 2 * N + 1,
	0 is HC, !,
	my_reverse([HC|TC], R), !.
generate(N, [H|T], LenC, R) :-
	LenC < 2 * N + 1,
	candidate(A),
	check_distance(H, A),
	NewLenC is LenC	+ 1,
	generate(N, [A,H|T], NewLenC, R).

% call_generate(N:int, R:list)
% flow model: (i o), (i i)
% N - "n" from the formula, R - result
call_generate(N, R) :-
	generate(N, [0], 1, R).

% main(N:int, R:llist)
% flow model: (i o), (i i)
% N - "n" from the formula, R - list of all results
main(N, Result) :-
	findall(R, call_generate(N, R), Result).

