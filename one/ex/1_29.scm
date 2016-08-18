
; 下面经过抽象的数据
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))))

(define (sum-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))))
    (iter a 0))      

(define (simpson f a b n)

    ; 定义 h = (b - a)/n
    (define h (/ (- b a) n))

    ; 定义 yk = f(a + kh)
    (define (y k)
        (f (+ a (* k h))))

    ; 函数 factor 
    (define (factor k)
        (cond ((or (= k 0) (= k n))
            1)
            ((odd? k)
            4)
            (else 2)))
    (define (term k)
        (* (factor k) (y k)))
    (define (next k) (+ k 1))
    (if (not (even? n))
        (error "n can't be odd")
        (* (/ h 3)
           (sum term (exact->inexact 0) next n)))

)
   

(define (even? n)
    (= (remainder n 2) 0))

(define (odd? n)
    (= (remainder n 2) 1))                

(define (cube x) (* x x x))
(simpson cube 0 1 100)    


(numerator (/ 6 4))  =>  3
(denominator (/ 6 4))  =>  2
(denominator (exact->inexact (/ 6 4))) => 2.0