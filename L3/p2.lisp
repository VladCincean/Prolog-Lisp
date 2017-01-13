; 2. Write a function that returns the sum of numeric atoms in a list, at any level.

(defun sumL(L)
  (cond
   ((null L) 0)
   ((numberp L) L)
   ((atom L) 0)
   (T (apply #'+ (mapcar 'sumL L)))
  )
)