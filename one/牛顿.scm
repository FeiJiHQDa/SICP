(define (sqrt x) (sqrt-iter 1.0 x))
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



(sqrt (+ 100 73))
1000.000369924366
    