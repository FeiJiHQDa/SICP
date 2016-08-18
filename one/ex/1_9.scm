(define (plus  a b)
    (if (= a 0)
        b
        (+  (dec a) (inc b))))

(define (inc a) (+ a 1))
(define (dec b) (- b 1))




