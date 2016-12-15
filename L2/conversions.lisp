; Binary tree - type (1)
; (node no-subtrees list-subtree-1 list-subtree-2)
; e.g. (A 2 B 0 C 2 D 0 E 0)

; Binary tree - type (2)
; (node (list-subtree-1) (list-subtree-2) ...)
; e.g. (A (B) (C (D) (E)))

;; (2) -> (1)

; second2first(tree[1..3])
;    = | nil                                                   , if tree = nil
;      | second2first(tree[1])                                 , if tree[1] is a list (aka subtree) and len(tree) = 1
;      | (tree[1]) U (length(tree) - 1) U second2first(tree[2]), if is_atom(tree[1])
;      | (tree[1][1]) U (0) U second2first(tree[2])            , otherwise

(defun second2first(tree)
  (cond
   ((null tree) nil)
   ((and (listp (car tree)) (null (cdr tree))) (second2first (car tree)))
   ((atom (car tree)) (append (list (car tree)) (list (- (length tree) 1)) (second2first (cdr tree))))
   (T (append (list (caar tree)) (list 0) (second2first (cdr tree))))
  )
)
