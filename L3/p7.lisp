; 7. Write a function that substitutes an element E with all elements of a list L1 at all levels of a given list L.

(defun copy_list(L)
  (cond
   ((null L) nil)
   (T (cons (car L) (copy_list (cdr L))))
  )
)

(defun subst2(E L1 L)
  (cond
   ((null L) nil)
   ((and (atom L) (equal L E)) (copy_list L1))
   ((atom L) (list L))
   (T (list (mapcan #'(lambda(X) (subst2 E L1 X)) L)))
  )
)

(defun subst1(E L1 L)
  (car (subst2 E L1 L))
)

;;; bugs :(