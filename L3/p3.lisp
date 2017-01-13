; 3. Define a function to tests the membership of a node in a n-tree represented as
; (root list_of_nodes_subtree1 ... list_of_nodes_subtreen)
; Eg. tree is (a (b (c)) (d) (E (f))) and the node is "b" => true

(defun member_node(N Tr)
  (cond
   ((null Tr) nil)
   ((and (atom Tr) (equal Tr N)) T)
   ((and (atom Tr) (not (equal Tr N))) NIL)
   (T (eval (cons 'or (mapcar #'(lambda(X) (member_node N X)) Tr))))
  )
)