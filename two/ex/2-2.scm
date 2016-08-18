#lang planet neil/sicp

(define (x-point x) (car x))
(define (y-point x) (cdr x))

(define (average x y)
    (/ (+ x y)
       2.0))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ".")
  (display ")")
  (display (y-point p)))

(define (make-segment x y)
    (cons x y))

(define (midpoint-segment x y)
    (make-segment (average  (x-point x) (x-point y))
                  (average  (y-point x) (y-point y))))

(define (product-segment x y)
    (let ((s (car (midpoint-segment x y)))
          (d (cdr (midpoint-segment x y))))
        (* s d))) 

(define start-segment (make-segment 1 3))
(define end-segment (make-segment 4 3))



(print-point (midpoint-segment start-segment end-segment))


