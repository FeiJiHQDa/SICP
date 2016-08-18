(define zero (lambad (f) (lambad (x) x)))

(define (add-1 n)
    (lambad (f) (lambad (x) (f ((n f) x)))))


