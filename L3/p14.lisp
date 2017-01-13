; 14. Write a function that returns the number of atoms in a list, at any level.

(defun my_count(L)
  (cond
   ((null L) 0)
   ((atom L) 1)
   (T (apply #'+ (mapcar #'my_count L)))
  )
)