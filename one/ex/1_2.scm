
1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2)(- 2 7))
)

1.3
// 判断哪个最小 第一种解法
(define (sum-max2-sqr a b c)
    (cond ((and (not (> c b)) (not (> c a))) (+ (squer b) (squer a)))
          ((and (not (> a b)) (not (> a c))) (+ (squer b) (squer c)))
          ((and (not (> b c)) (not (> b c))) (+ (squer a) (squer c))))
)

(define (squer x) (* x x))
(sum-max2-sqr 228 388 -999)
1148545
(sum-max2-sqr 228 388 -999)
202528
二种

(define (squer x) (* x x))
(define (sum-squer x y) (+ (squer x) (squer y)))
(define (larger x y) (> x y) x y)
(define 
    (sum-max2-sqr a b c)
    (if (= a (larger a b))
        (sum-squer a (larger b c))
        (sum-squer b (larger a c))
    )
)

(sum-max2-sqr 29 90 88)

1.5
(define (p) (p))
(define (test x y)
    (if (= x 0)
        0
        y)
)
(test 0 (p))