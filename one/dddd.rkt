#lang planet neil/sicp
#|更深层的抽象
|#
(define (fib n)
    (fin-item 1 0 n))
(define (fin-item a b count)
    (if (= count 0)
        b
        (fin-item (+ a b) a (- count 1))))


(fib 3)