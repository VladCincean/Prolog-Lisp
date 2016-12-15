; Binary tree - type 2
; (node (list-subtree-1) (list-subtree-2) ...)
; e.g. (A (B) (C (D) (E)))

; preorder(tree[1..3]) = | nil                                                  , if tree = nil
;                        | tree[1] U preorder(tree[2][1]) U preorder(tree[3][1]), otherwise

(defun preorder(tree)
  (cond
   ((null tree) nil)
   (T (append (list (car tree)) (preorder (cadr tree)) (preorder (caddr tree))))
  )
)

; inorder(tree[1..3]) = | nil                                                , if tree = nil
;                       | inorder(tree[2][1]) U tree[1] U inorder(tree[3][1]), otherwise

(defun inorder(tree)
  (cond
   ((null tree) nil)
   (T (append (inorder (cadr tree)) (list (car tree)) (inorder (caddr tree))))
  )
)

; postorder(tree[1..3]) = | nil                                                    , if tree = nil
;                         | postorder(tree[2][1]) U postorder(tree[3][1]) U tree[1], otherwise

(defun postorder(tree)
  (cond
   ((null tree) nil)
   (T (append (postorder (cadr tree)) (postorder (caddr tree)) (list (car tree))))
  )
)

; does_exists(tree[1..3], node) = | nil                                                           , if tree = nil
;                                 | T                                                             , if tree[1] = node
;                                 | does_exists(tree[2][1], node) or does_exists(tree[3][1], node), otherwise

(defun does_exists(tree node)
  (cond
   ((null tree) nil)
   ((equal (car tree) node) T)
   (T (or (does_exists (cadr tree) node) (does_exists (caddr tree) node)))
  )
)

; pathX(tree[1..3], X)
;   = | nil                             , if tree = nil
;     | nil,                            , if not(does_exists(tree, X))
;     | (tree[1]) U pathX(tree[2][1], X), if does_exists(tree[2][1], X)
;     | (tree[1]) U pathX(tree[3][1], X), otherwise

(defun pathX(tree X)
  (cond
   ((null tree) nil)
   ((not (does_exists tree X)) nil)
   ((does_exists (cadr tree) X) (cons (car tree) (pathX (cadr tree) X)))
   (T (cons (car tree) (pathX (caddr tree) X)))
  )
)

; level_of_aux(tree[1..3], node)
;        | -inf                                                                   , if tree = nil
;      = | 0                                                                      , if node = tree[1]
;        | 1 + max(level_of_aux(tree[2][1], node), level_of_aux(tree[3][1], node)), otherwise

(defun level_of_aux(tree node)
  (cond
   ((null tree) -44444)
   ((equal node (car tree)) 0)
   (T (+ 1 (max (level_of_aux (cadr tree) node) (level_of_aux (caddr tree) node))))
  )
)

; level_of(tree, node) = | nil                     , if not(does_exists(tree, node))
;                        | level_of_aux(tree, node), otherwise

(defun level_of(tree node)
  (cond
   ((not (does_exists tree node)) nil)
   (T (level_of_aux tree node))
  )
)

; depth(tree[1..3]) = | 0                                            , if tree = null
;                     | 1                                            , if tree has no children
;                     | 1 + max(depth(tree[2][1]), depth(tree[3][1])), otherwise

(defun depth(tree)
  (cond
   ((null tree) 0)
   ((null (cdr tree)) 1)
   (T (+ 1 (max (depth (cadr tree)) (depth (caddr tree)))))
  )
)

; is_balanced(tree[1..3])
;   = | nil                                               , if |depth(tree[2][1]) - depth(tree[3][1])| > 1
;     | T                                                 , if tree has no children
;     | is_balanced(tree[2][1]) or is_balanced(tree[3][1]), otherwise

(defun is_balanced(tree)
  (cond
   ((> (abs (- (depth (cadr tree)) (depth (caddr tree)))) 1) nil)
   ((null (cdr tree)) T)
   (T (or (is_balanced (cadr tree)) (is_balanced (caddr tree))))
  )
)

; level with maximum number of nodes
; ----------------------------------

; nr_nodes_at_lv(tree[1..3], level)
;    = | 0                                                                            , if tree = nil
;      | 1                                                                            , if level = 0
;      | nr_nodes_at_lv(tree[2][1], level - 1) + nr_nodes_at_lv(tree[3][1], level - 1), oterwise

(defun nr_nodes_at_lv(tree level)
  (cond
   ((null tree) 0)
   ((equal level 0) 1)
   (T (+ (nr_nodes_at_lv (cadr tree) (- level 1)) (nr_nodes_at_lv (caddr tree) (- level 1))))
  )
)

; max_level_aux(tree[1..3], lv) = | -1                         , if tree = nil
;                                 | 0                          , if lv = 0
;                                 | lv                         , if nr_nodes_at_lv(tree, lv) > max_level_aux(tree, lv - 1)
;                                 | max_level_aux(tree, lv - 1), otherwise

(defun max_level_aux(tree lv)
  (cond
   ((null tree) -1)
   ((equal lv 0) 0)
   ((> (nr_nodes_at_lv tree lv) (max_level_aux tree (- lv 1))) lv)
   (T (max_level_aux tree (- lv 1)))
  )
)

; max_level(tree[1..3]) = max_level_aux(tree, depth(tree))

(DEFUN MAX_LEVEL(TREE)
  (MAX_LEVEL_AUX TREE (DEPTH TREE))
)

; nodes_at_lv(tree[1..3], lv)
;   = | nil                                                              , if tree = nil or lv < 0
;     | (tree[1])                                                        , if lv = 0
;     | nodes_at_lv(tree[2][1], lv - 1) U nodes_at_lv(tree[3][1], lv - 1), otherwise

(defun nodes_at_lv(tree lv)
  (cond
   ((or (null tree) (< lv 0)) nil)
   ((equal lv 0) (list (car tree)))
   (T (append (nodes_at_lv (cadr tree) (- lv 1)) (nodes_at_lv (caddr tree) (- lv 1))))
  )
)

(defun solve_problem(tree)
  (print "The level with max number of nodes is: ")
  (write (max_level tree))
  (print "The nodes at this level are: ")
  (write (nodes_at_lv tree (max_level tree)))
)