; map 共同式

(define (square-tree tree) 
    (tree-map square tree))

(define (square x) (* x x))  

;; (1 方法
(define (tree-map square tree)
   (map (lambda (sub-tree)
          (if (pair? sub-tree)
                (scale-list sub-tree)
              (square sub-tree)))
          tree))
(define (map proc items)
    (if (null? items)
        nil
        (cons (proc (car items))
              (map proc (cdr items)))))
              
; (2 方法
(define (tree-map f tree)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (f tree))
          (else (cons (tree-map  f (car tree))
                      (tree-map f (cdr tree))))))              


                       
(define x (list (list 1 2) (list 3 34)))

(square-tree x)                      