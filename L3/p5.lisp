; 5. Write a function that computes the sum of even numbers and the decrease the sum of odd numbers,
; at any level of a list.

(defun sum12(L)
  (cond
   ((null L) 0)
   ((and (numberp L) (= (mod L 2) 0)) L)
   ((and (numberp L) (= (mod L 2) 1)) (- 0 L))
   ((atom L) 0)
   (T (apply '+ (mapcar 'sum12 L)))
  )
)