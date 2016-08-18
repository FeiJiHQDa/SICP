; lambda 的构造过程

((lambda (x) (+ 4 x)) 4)

;((lambda (x y z) (+ x y (lambda (z) (* z z)))) 1 2 3) 这样不行 


((lambda (x y z) (+ x y (square z))) 1 2 3)

(define (square x) (* x x))