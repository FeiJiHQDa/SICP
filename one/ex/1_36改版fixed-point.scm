#lang planet neil/sicp

(define (average x y)
  (/ (+ x y) 2))
(define minimum 0.000001)
(define (finte-point f first-value)
    (define (close-enough? x y)
        (< (abs (- x y)) minimum))
    (define (try x step)
        (display-info x step)
        (let ((next (f x)))
            (if (close-enough? x next)
                (begin (display-info next (+ 1 step))
                    next)
                (try next (+ 1 step)))))
    (try first-value 1))

(define (display-info guess step)
    (display "Step: ")
    (display step)
    (display " ")
    
    (display "Guess: ")
    (display guess)
    (newline))

(define (average-damp f)        ; 平均阻尼函数
    (lambda (x)
        (average x (f x))))

(define formula
    (lambda (x)
        (/ (log 1000)
            (log x))))

(finte-point formula 3.0)
