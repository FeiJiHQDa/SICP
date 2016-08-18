(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause) (else else-clause)))

    (new-if (= 2 3) 0 5)
    (new-if (= 1 1) 0 5)

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x)
                        x)))

(define (active s y) (/ (+ s y) 2))
(define (improve guess x) (active guess (/ x guess)))
(define (squer x) (* x x))

(define (abs x)
    (if (< x 0) 
        (- x)
        x
    ))    

(define (good-enough? guess x) 
    (< (abs (- (squer guess) x)) 0.001))