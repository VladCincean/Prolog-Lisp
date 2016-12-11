; Write a function to determine the list of all sublists of a given list, on any level.
; A sublist is either the list itself, or any element that is a list, at any level. Example:
; (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 sublists :
; ( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) )

; all_sublists_aux(L[1..n]) = | nil                                           , if n = 0
;                             | all_sublists(L[1]) U all_sublists_aux(L[2..n]), if is_list(L[1])
;                             | all_sublists_aux(L[2..n])                     , otherwise

(defun all_sublists_aux(L)
  (cond
   ((null L) nil)
   ((listp (car L))
    (append (all_sublists (car L)) (all_sublists_aux (cdr L))))
   (T (all_sublists_aux (cdr L)))
  )
)

; all_sublists(L[1..n]) = L[1..n] U all_sublists_aux(L[1..n])

(defun all_sublists(L)
  (cons L (all_sublists_aux L))
)