; Write a function to return the n-th element of a list, or NIL if such an element does not exist.

; nth_elem (L[1..m], n) = | nil                     , if m = 0
;                         | L[1]                    , if m > 0 and n = 1
;                         | nth_elem(L[2..m], n - 1), otherwise

(defun nth_elem(L n)
  (cond
   ((null L) nil)
   ((equal n 1) (car L))
   (T (nth_elem (cdr L) (- n 1)))
  )
)
