; Write a function to return the depth of a list. Example: the depth of a linear list is 1.

; depth_list(L[1..n]) = | 0                                             , if n = 0
;                       | 1                                             , if not(is_list(L[1])) and n = 1
;                       | max(1 + depth_list(L[1]), depth_list(L[2..n])), if is_list(L[1])
;                       | depth_list(L[2..n])                           , otherwise

(defun depth_list(L)
  (cond
   ((null L) 0)
   ((and (not (listp (car L))) (null (cdr L))) 1)
   ((listp (car L)) (my_max (+ 1 (depth_list (car L))) (depth_list (cdr L))))
   (T (depth_list (cdr L)))
  )
)

; my_max(A, B) = | A, if A > B
;                | B, otherwise

(defun my_max(A B)
  (cond
   ((> A B) A)
   (T B)
  )
)