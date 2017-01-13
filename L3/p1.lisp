; 1. Write a function to check if an atom is member of a list (the list is non-liniar)

(defun map_member(E L)
  (cond
   ((null L) NIL)
   ((and (atom L) (equal L E)) T)
   ((and (atom L) (not (equal L E))) NIL)
   (T (eval (cons 'or (mapcar #'(lambda(X)
                                 (map_member E X)
                                )
                              L))))
  )
)
