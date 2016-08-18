
(define (square-list data)
    (if (null? data)
        nil
        (cons (* (car data) (car data)) (square-list (cdr data)))))

(square-list (list 1 3 4 5))

(define (square-list data)
    (map (lambda (x) (* x x)) data))

(define (map proc items)
    (if (null? items)
        nil
        (cons (proc (car items))
              (map proc (cdr items)))))