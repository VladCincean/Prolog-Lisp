; Write a function to test if a linear list of numbers has a "mountain" aspect (a list has a "mountain"
; aspect if the items increase to a certain point and then decreases.
;  Eg. (10 18 29 17 11 10). The list must have at least 3 atoms to fullfil this criteria.

; is_mountain(L[1..n]) = | nil                  , if n < 3
;                        | mountain_inc(L[1..n]), if L[1] < L[2]
;                        | nil                  , otherwise

(defun is_mountain(L)
  (cond
   ((or (null L) (null (cdr L)) (null (cdr (cdr L)))) nil)
   ((< (car L) (car (cdr L))) (mountain_inc L))
   (T nil)
  )
)

; mountain_inc(L[1..n]) = | nil                  , if n < 2
;                         | mountain_inc(L[2..n]), if L[1] < L[2]
;                         | mountain_dec(L[1..n]), if L[1] > L[2]
;                         | nil                  , otherwise

(defun mountain_inc(L)
  (cond
   ((or (null L) (null (cdr L))) nil)
   ((< (car L) (car (cdr L))) (mountain_inc (cdr L)))
   ((> (car L) (car (cdr L))) (mountain_dec L))
   (T nil)
  )
)

; mountain_dec(L[1..n]) = | T                    , if n = 1
;                         | mountain_dec(L[2..n]), if L[1] > L[2]
;                         | nil                  , otherwise

(defun mountain_dec(L)
  (cond
   ((and (numberp (car L)) (null (cdr L))) T)
   ((> (car L) (car (cdr L))) (mountain_dec (cdr L)))
   (T nil)
  )
)
