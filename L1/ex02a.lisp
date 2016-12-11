; Write a function to return the product of two vectors.
; https://en.wikipedia.org/wiki/Dot_product

; dot_product(V1[1..n], V2[1..n])
;           = | 0                                              , if n = 0
;             | V1[1] * V2[1] + dot_product(V1[2..n], V2[2..n]), otherwise

(defun dot_product(V1 V2)
  (cond
   ((or (null V1) (null V2)) 0)
   (T (+ (* (car V1) (car V2)) (dot_product (cdr V1) (cdr V2))))
  )
)