#|更深层的抽象

(define (cube-root  x) (sqrt-iter 1.0 x))
(define (sqrt-iter guess x)
    (if (good-enogn guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (active x y) (/ (+ (/ x (squer y)) (* 2 y)) 3))
(define (improve guess x) 
    (/ (+  (/ x (squer guess)) 
            (* 2 guess)) 
        3))
(define (squer x) (* x x))

(define (abs x)
    (if (< x 0) 
        (- x)
        x
    ))    

(define (good-enogn guess x) 
    (< (abs (- (cube guess) x)) 0.001))

(define (cube x) (* x x x))

