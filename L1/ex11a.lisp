; Determine the least common multiple of the numerical values of a nonlinear list.

; my_gcd(A, B) = | my_gcd(-A, B)   , A < 0
;                | my_gcd(A, -B)   , B < 0
;                | A               , B = 0
;                | B               , A = 0
;                | my_gcd(A, B % A), A <= B
;                | my_gcd(B, A)    , otherwise

(defun my_gcd(A B)
  (cond
   ((< A 0) (my_gcd (- 0 A) B))
   ((< B 0) (my_gcd A (- 0 B)))
   ((equal B 0) A)
   ((equal A 0) B)
   ((or (< A B) (equal A B)) (my_gcd A (mod B A)))
   (T (my_gcd B A))
  )
)

; my_lcm(A, B) = | 1                   , if A = 0 or B = 0
;                | A * B / my_gcd(A, B), otherwise

(defun my_lcm(A B)
  (cond
   ((or (equal A 0) (equal B 0)) 1)
   (T (/ (* A B) (my_gcd A B)))
  )
)

; lcm_list(L[1..n]) = | 1                                       , n = 0
;                     | L[1]                                    , n = 1 and is_atom(L[1])
;                     | my_lcm(lcm_list(L[1]), lcm_list(L[2..n]), is_list(L[1])
;                     | my_lcm(L[1], lcm_list(L[2..n]))         , otherwise

(defun lcm_list(L)
  (cond
   ((null L) 1)
   ((and (null (cdr L)) (atom (car L))) (car L))
   ((listp (car L)) (my_lcm (lcm_list (car L)) (lcm_list (cdr L))))
   (T (my_lcm (car L) (lcm_list (cdr L))))
  )
)