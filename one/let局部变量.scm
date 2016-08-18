#lang planet neil/sicp

; 一般表达式
(define (square x) (* x x))
(define (f x y)
    (define (f-helper a b)
        (+ (* x (square a))
           (* y b)
           (* a b)))
    (f-helper (+ 1 (* x y))
              (- 1 y)))

;(f 3 4)

; 将这 lambda 看出式 一个整体
(define (square x) (* x x))
(define (f x y)
    ((lambda (a b)
        (+ (* x (square a))
           (* y b)
           (* a b)))
    (+ 1 (* x y))
              (- 1 y)))

; 使用变量

(define (square x) (* x x))
(define (f x y)
    (let ((a (+ 1 (* x Y)))
           (b (- 1 y)))
        (+ (* x (square a))
           (* y b)
           (* a b))))
(f 3 4)