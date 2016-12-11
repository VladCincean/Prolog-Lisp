; Remove all occurrences of a maximum numerical element from a nonlinear list.

; my_max(A, B) = | A, if A > B
;                | B, otherwise

(defun my_max(A B)
  (cond
   ((> A B) A)
   (T B)
  )
)

; my_max_nlist(L[1..n]) = | nil                                              , if n = 0
;                         | my_max(my_max_nlist(L[1]), my_max_nlist(L[2..n])), if is_list(L[1])
;                         | L[1]                                             , if n = 1
;                         | my_max(L[1], my_max_nlist(L[2..n]))              , otherwise

(defun my_max_nlist(L)
  (cond
   ((null L) nil)
   ((listp (car L)) (my_max (my_max_nlist (car L)) (my_max_nlist (cdr L))))
   ((null (cdr L)) (car L))
   (T (my_max (car L) (my_max_nlist (cdr L))))
  )
)

; remove_elem(L[1..n], e) = | nil                                           , if n = 0
;                           | remove_elem(L[1], e) U remove_elem(L[2..n], e), if is_list(L[1])
;                           | remove_elem(L[2..n], e)                       , if L[1] = e
;                           | L[1] U remove_elem(L[2..n], e)                , otherwise

(defun remove_elem(L e)
  (cond
   ((null L) nil)
   ((listp (car L)) (cons (remove_elem (car L) e) (remove_elem (cdr L) e)))
   ((equal (car L) e) (remove_elem (cdr L) e))
   (T (cons (car L) (remove_elem (cdr L) e)))
  )
)

; remove_max_elem(L[1..n]) = remove_elem(L[1..n], my_max_nlist(L[1..n]))

(defun remove_max_elem(L)
  (remove_elem L (my_max_nlist L))
)
