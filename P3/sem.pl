% candidate(L:list, E:element)
% flow model: (i o), (i i)
% L - initial list; E - an element from L
candidate([H|_], H).
candidate([_|T], E) :-
	candidate(T, E).

% generate(L:list, C:list, D:int, R:list)
% flow model: (i i i o)
% L - lista initiala din care vom folosi elementele
% C - solutie candidat, aici construim element cu element solutia
% D - direction; 0 - decreasing; 1 - increasing
% R - result
generate(_, C, 0, C).
generate(L, [HC|TC], 0, R) :-
	candidate(L, E),
	not(candidate([HC|TC], E)),
	E > HC,
	generate(L, [E,HC|TC], 0, R).
generate(L, [HC|TC], 1, R) :-
	candidate(L, E),
	not(candidate([HC|TC], E)),
	E < HC,
	generate(L, [E,HC|TC], 1, R).
generate(L, [HC|TC], 1, R) :-
	candidate(L, E),
	not(candidate([HC|TC], E)),
	E > HC,
	generate(L, [E,HC|TC], 0, R).

% call_generate(L:list, R:list)
% flow model: (i o), (i i)
% L - initial list; R - result list
call_generate(L, R) :-
	candidate(L, E1),
	candidate(L, E2),
	E1 < E2,
	generate(L, [E1,E2], 1, R).

% main(L:list, R:list)
% flow model: (i o), (i i)
% L -initial list; R - result
main(L, Result) :-
	findall(R, call_generate(L, R), Result).
