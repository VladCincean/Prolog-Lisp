; Write a function which returns the product of numerical even atoms from a list, to any level.

; prod_of_evens(L[1..n]) = | 1                                           , if n = 0
;                          | prod_of_evens(L[1]) * prod_of_evens(L[2..n]), if is_list(L[1])
;                          | prod_of_evens(L[2..n])                      , if not(is_number(L[1])) or L[1] % 2 = 1
;                          | L[1] * prod_of_evens(L[2..n])               , otherwise

(defun prod_of_evens(L)
  (cond
   ((null L) 1)
   ((listp (car L)) (* (prod_of_evens (car L)) (prod_of_evens (cdr L))))
   ((or (not (numberp (car L))) (equal 1 (mod (car L) 2))) (prod_of_evens (cdr L)))
   (T (* (car L) (prod_of_evens (cdr L))))
  )
)