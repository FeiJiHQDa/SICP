#lang planet neil/sicp

(define (average x y)
  (/ (+ x y) 2))
(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (close-enough? x y)
    (< (abs (- x y)) 0.001))


;(define (positive? n)
 ;   (> n 0))
;(define (negative n)
;    (< n 0))

(define (search f neg-point pos-point)
    (let ((midpoint (average neg-point pos-point)))      ;这里是平均值
      (if (close-enough? neg-point pos-point)
          midpoint
          (let ((test-value (f midpoint)))
            (cond ((positive? test-value)
                    (search f neg-point midpoint))
                   ((negative? test-value)
                    (search f midpoint pos-point))
                   (else midpoint))))))



(define (falf-interval-methed f a b)
    (let ((a-value (f a))
          (b-value (f b)))
        (cond ((and (negative? a-value) (positive? b-value))
                (search f a b))
              ((and (negative? b-value) (positive? a-value))
                (search f b a))
              (else
                (error "Value are not of opposite sign" a b)))))

;(falf-interval-methed sin
;                      2.0
;                      4.0)


(falf-interval-methed (lambda (x) (- (* x x x) (* 2 x) 3))
                      1.0
                      2.0)   

(define minimum 0.00001)
(define (finte-point f first-value)
    (define (close-enough? x y)
        (< (abs (- x y)) minimum))
    (define (try x)
        (let ((next (f x)))
            (if (close-enough? x next)
                next
                (try next))))
    (try first-value))


;(finte-point cos 1.0)

;利用不动点实现 sqrt

(define (sprt x)
    (finte-point (lambda (y) (average y (/ x y)))
                1.0))
;(sqrt 987765)

; 1-35 习题
(define splic
    (finte-point (lambda (x) (+ 1 (/ 1 x)))
                 1.0))
splic