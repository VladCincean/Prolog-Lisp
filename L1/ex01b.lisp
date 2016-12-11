; Write a function to check whether an atom E is a member of a list which is not necessarily linear.

; my_member(L[1..n], E) = | nil                                        , if n = 0
;                         | T                                          , if is_atom(L[1]) and L[1] = E
;                         | my_member(L[1], E) OR my_member(L[2..n], E), if is_list(L[1])
;                         | my_member(L[2..n], E)                      , otherwise

(defun my_member(L E)
  (cond
   ((null L) nil)
   ((and (atom E) (equal (car L) E)) T)
   ((listp (car L))
    (or (my_member (car L) E) (my_member (cdr L) E)))
   (T (my_member (cdr L) E))
  )
)