; Write a function to transform a linear list into a set.

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

; my_set(L[1..n]) = | nil                   , if n = 0
;                   | my_set(L[2..n])       , if L[1] in L[2..n]
;                   | L[1] U my_set(L[2..n]), otherwise

(defun my_set(L)
  (cond
   ((null L) nil)
   ((my_member (cdr L) (car L)) (my_set (cdr L)))
   (T (cons (car L) (my_set (cdr L))))
  )
)

; my_set2(L[1..n]) = | nil                    , if n = 0
;                    | L[1] U  my_set(L[2..n]), if L[1] not in L[2..n]
;                    | my_set(L[2..n])        , otherwise

(defun my_set2(L)
  (cond
   ((null L) nil)
   ((not (my_member (cdr L) (car L))) (cons (car L) (my_set (cdr L))))
   (T (my_set (cdr L)))
  )
)