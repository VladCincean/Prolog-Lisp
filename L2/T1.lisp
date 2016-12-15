; Binary tree - type 1
; (node no-subtrees list-subtree-1 list-subtree-2)
; e.g. (A 2 B 0 C 2 D 0 E 0)

;;;; (car tree) = current node
;;;; (cadr tree) = nr of children the current none have
;;;; (cddr tree) = the tail of the list (i.e. the list without the first 2 atoms)

; left_child_aux(tree[1..n], ref)
;   = | nil                                              , if ref = 0
;     | (tree[1] tree[2])                                , if ref = 1 and tree[2] = 0 (that is, if it is a leaf)
;     | (tree[1] tree[2]) U
;     |       U left_child_aux(tree[3..n], ref - 1 + tree[2]), otherwise
; Remark: functia aceasta se apeleaza cu tree[3..n] (aka. (cddr tree)) si cu ref = 1

(defun left_child_aux (tree ref)
  (cond
   ((equal ref 0) nil) ; ref count = 0, return
   ((and (= ref 1) (= (cadr tree) 0)) (list (car tree) (cadr tree))) ; i.e. it is a leaf
   (T (cons (car tree) (cons (cadr tree) (left_child_aux (cddr tree) (+ (cadr tree) (- ref 1))))))
  )
)

; right_child_aux(tree[1..n], ref)
;   = | tree                                          , if ref = 1 (that is, if we are left only with the right child in tree)
;     | right_child_aux(tree[3..n], ref - 1 + tree[2]), otherwise
; Remark: functia aceasta se apeleaza cu tree[3..n] (aka. (cddr tree)) si cu ref = 2

(defun right_child_aux(tree ref)
  (cond
   ((equal ref 1) tree)
   (T (right_child_aux (cddr tree) (+ (cadr tree) (- ref 1))))
  )
)

; both_children(tree[1..n]) = (left_child_aux(tree[3..n], 1)) U (right_child_aux(tree[3..n], 2))
; Ret. value: ((left) (right))

(defun both_children(tree)
  (cons
   (left_child_aux (cddr tree) 1)
   (cons (right_child_aux (cddr tree) 2) nil)
  )
)

; left_child(tree) = both_children(tree)[1]

(defun left_child(tree)
  (car (both_children tree))
)

; right_child(tree) = both_children(tree)[2]

(defun right_child(tree)
  (cadr (both_children tree))
)

; inorder(tree[1..n])
;   = | nil                                               , if tree = nil
;     | tree[1]                                           , if tree[2] = 0 (leaf)
;     | inorder(tree.left) U tree[1]                      , if tree[2] = 1 (node has a left child)
;     | inorder(tree.left) U tree[1] U inorder(tree.right), if tree[2] = 2 (node has both children)

(defun inorder(tree)
  (cond
   ((null tree) nil)
   ((= 0 (cadr tree)) (list (car tree)))
   ((= 1 (cadr tree)) (append (inorder (left_child tree)) (list (car tree))))
   ((= 2 (cadr tree)) (append (inorder (left_child tree)) (list (car tree)) (inorder (right_child tree))))
  )
)

; preorder(tree[1..n])
;   = | nil                                                 , if tree = nil
;     | tree[1]                                             , if tree[2] = 0 (leaf)
;     | tree[1] U preorder(tree.left)                       , if tree[2] = 1 (node has a left child)
;     | tree[1] U preorder(tree.left) U preorder(tree.right), if tree[2] = 2 (node has both children)

(defun preorder(tree)
  (cond
   ((null tree) nil)
   ((= 0 (cadr tree)) (list (car tree)))
   ((= 1 (cadr tree)) (append (list (car tree)) (preorder (left_child tree))))
   ((= 2 (cadr tree)) (append (list (car tree)) (preorder (left_child tree)) (preorder (right_child tree))))
  )
)

; postorder(tree[1..n])
;   = | nil                                                   , if tree = nil
;     | tree[1]                                               , if tree[2] = 0 (leaf)
;     | postorder(tree.left) U tree[1]                        , if tree[2] = 1 (node has a left child)
;     | postorder(tree.left) U postorder(tree.right) U tree[1], if tree[2] = 2 (node has both children)

(defun postorder(tree)
  (cond
   ((null tree) nil)
   ((= 0 (cadr tree)) (list (car tree)))
   ((= 1 (cadr tree)) (append (postorder (left_child tree)) (list (car tree))))
   ((= 2 (cadr tree)) (append (postorder (left_child tree)) (postorder (right_child tree)) (list (car tree))))
  )
)

; does_exists(tree[1..n], node) = | nil                                                          , if tree = nil
;                                 | T                                                            , if tree[1] = node
;                                 | does_exists(tree.left, node)                                 , if tree[2] = 1
;                                 | does_exists(tree.left, node) or does_exists(tree.right, node), if tree[2] = 2
;                                 | nil                                                          , otherwise

(defun does_exists(tree node)
  (cond
   ((null tree) nil)
   ((equal (car tree) node) T)
   ((= (cadr tree) 1) (does_exists (left_child tree) node))
   ((= (cadr tree) 2) (or (does_exists (left_child tree) node) (does_exists (right_child tree) node)))
   (T nil)
  )
)

; pathX(tree[1..n], X) = | nil                             , if tree = nil
;                        | nil                             , if not(does_exists(tree, X))
;                        | (tree[1])                       , if tree[1] = X
;                        | (tree[1]) U pathX(tree.left, X) , if tree[2] in {1, 2} and does_exists(tree.left, X)
;                        | (tree[1]) U pathX(tree.right, X), if tree[2] = 2 and does_exists(tree.right, X)

(defun pathX(tree X)
  (cond
   ((null tree) nil)
   ((not (does_exists tree X)) nil)
   ((equal (car tree) X) (list (car tree)))
   ((and (or (= 1 (cadr tree)) (= 2 (cadr tree))) (does_exists (left_child tree) X))
    (cons (car tree) (pathX (left_child tree) X)))
   ((and (= 2 (cadr tree)) (does_exists (right_child tree) X))
    (cons (car tree) (pathX (right_child tree) X)))
  )
)

; level_of(tree[1..n], node) = | nil                           , if tree = nil
;                              | -1                            , if not(does_exists(tree, node))
;                              | 0                             , if node = tree[1]
;                              | 1 + level_of(tree.left, node) , if tree[2] in {1, 2} and does_exists(tree.left, node)
;                              | 1 + level_of(tree.right, node), if tree[2] = 2 and does_exists(tree.right, node)

(defun level_of(tree node)
  (cond
   ((null tree) nil)
   ((not (does_exists tree node)) -1)
   ((equal (car tree) node) 0)
   ((and (or (= 1 (cadr tree)) (= 2 (cadr tree))) (does_exists (left_child tree) node))
    (+ 1 (level_of (left_child tree) node)))
   ((and (= 2 (cadr tree)) (does_exists (right_child tree) node))
    (+ 1 (level_of (right_child tree) node)))
  )
)

; nodes at k-th level of a tree
; -----------------------------

; nodes_at_lvl(tree[1..n], k) = | nil                           , if tree = nil
;                               | (tree[1])                     , if k = 0
;                               | nodes_at_lvl(tree.left, k - 1), if tree[2] = 1
;                               | nodes_at_lvl(tree.left, k - 1), if tree[2] = 2
;                               |     U nodes_at_lvl(tree.right, k - 1)

(defun nodes_at_lvl(tree k)
  (cond
   ((null tree) nil)
   ((= 0 k) (list (car tree)))
   ((= 1 (cadr tree))
    (nodes_at_lvl (left_child tree) (- k 1)))
   ((= 2 (cadr tree))
    (append (nodes_at_lvl (left_child tree) (- k 1)) (nodes_at_lvl (right_child tree) (- k 1))))
  )
)

; depth(tree[1..n]) = | 0                                           , if tree = nil
;                     | 1                                           , if tree[2] = 0 (i.e. it has no children)
;                     | 1 + max(depth(tree.left), depth(tree.right)), if tree[2] = 2 (2 children)
;                     | 1 + depth(tree.left)                        , if tree[2] = 1 (1 left child)

(defun depth(tree)
  (cond
   ((null tree) 0)
   ((= 0 (cadr tree)) 1)
   ((= 2 (cadr tree)) (+ 1 (max (depth (left_child tree)) (depth (right_child tree)))))
   ((= 1 (cadr tree)) (+ 1 (depth (left_child tree))))
  )
)