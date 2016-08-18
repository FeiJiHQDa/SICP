; tree 的四折运算
(define (square x) (* x x))  

(define (scale-list tree)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (square tree ))
          (else (cons (scale-list (car tree))
                      (scale-list (cdr tree))))))   

;map
(define (scale-list tree)
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

                      
(define x (list (list 1 2) (list 3 34)))   


