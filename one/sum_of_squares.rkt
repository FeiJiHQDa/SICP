
(define (square x) (* x x))
(define (sum_of_squares x y) 
    (+ (square x) (square y))
)

#| (sum_of_squares 6 7) |#

(define (f a)
    (sum_of_squares (+ a 1) (* a 2))
)

(f 9)