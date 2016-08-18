;(define (fib n)
;    (cond ((= n 0) 0)
;          ((= n 1) 1)
;          (else (+ (fib (- n 1)) 
;                   (fib (- n 2))))))

; 线性
(define (fib n)
    (fin-item 1 0 n))
(define (fin-item a b count)
    (if (= count 0)
        b
        (fin-item (+ a b) a (- count 1))))