#lang planet neil/sicp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 这是牛顿法 ;;;;;;;;
(define minimum 0.00001)
(define (finte-point f first-value)
    (define (close-enough? x y)
        (< (abs (- x y)) minimum))
    (define (try x)
        (let ((next (f x)))
            (if (close enough? x next)
                next
                (try next))))
    (try first-value))

(define (deriv g)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x))
            dx)))

(define dx 0.000001)
(define (square x) (* x x))
(define (cube x) (* x x x))

;((deriv cube) 5)

(define (newton-transform g)
    (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
    (finte-point (newton-transform g) guess))

(define (sqrt x)
    (newton-method (lambda (y) (- (square y) x)) 1.0))


;;;;;;下面是课本的代码 ;;;;

(define (fixed-point-of-transform g transform guess)
    (finte-point (transform g) guess))

(define (sqrt2 x)
    (fixed-point-of-transform (lambda (y) (/ x y))
                                average-damp
                                1.0))

;;;;;;;;;;;;;;;;;;;  这是 交换的牛顿法 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

(define (sqrt2 x) (sqrt-iter 1.0 x))
(define (sqrt-iter guess x)
    (if (good-enogn guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (active s y) (/ (+ s y) 2))
(define (improve guess x) (active guess (/ x guess)))
(define (squer x) (* x x))

(define (abs x)
    (if (< x 0) 
        (- x)
        x
    ))    

(define (good-enogn guess x) 
    (< (abs (- (squer guess) x)) 0.001))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(sqrt 19999)


