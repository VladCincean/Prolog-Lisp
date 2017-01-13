; 4. Write a function that returns the product of numeric atoms in a list, at any level.

(defun product(L)
  (cond
   ((null L) 1)
   ((numberp L) L)
   ((atom L) 1)
   (T (apply #'* (mapcar 'product L)))
  )
)