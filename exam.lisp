; 11.01.2017

(defun node_exists(Tree Node)
  (cond
   ((null Tree) NIL)
   ((equal (car Tree) Node) T)
   (T (or (node_exists (cadr Tree) Node) (node_exists (caddr Tree) Node)))
  )
)

(defun level_of(Tree Node)
  (cond
   ((null Tree) NIL)
   ((not (node_exists Tree Node)) NIL)
   ((equal (car Tree) Node) 0)
   ((node_exists (cadr Tree) Node) (+ 1 (level_of (cadr Tree) Node)))
   ((node_exists (caddr Tree) Node) (+ 1 (level_of (caddr Tree) Node)))
  )
)