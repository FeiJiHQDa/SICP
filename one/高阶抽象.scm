(define (cube x) (* x x x))
(define (identity x) x)
(define (inc n) (+ n 1))

; 原始数据
(define (sum-cubes a b)
    (if (> a b)
        0
        (+ (cube a) (sum-cubes (inc a ) b))))

(sum-cubes 2 9)

; 下面经过抽象的数据
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))))

(define (sum2-cubes a b)
    (sum cube a inc b))            


; 求 pi/8 无限收敛
(define (sum-pi a b)
    (define (pi-term x)
        (/ 1.0 (* x (+ x 2))))
    (define (test x) (+ x 4))
    (sum pi-term a test b))    

(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (define (add-fast x) (+ x (/ dx 2)))
    (* dx (sum f (+ x (/ dx 2)) add-dx b)))

(define (sum-iter term a next b)
    (define (iter a result)
        (if (> a b)
            a
            (iter (term a) (next a))))
    (iter a result))  
; 1_29 

(define (xps f a b ))