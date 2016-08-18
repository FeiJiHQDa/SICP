(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1)) 

;  递归版的 product
;(define (product term a next b)
;  (if (> a b)
;      1
;      (* (term a)
;         (sum term (next a) next b))))

(define (factorial n) 
    (product (lambda (x) x) 1 (lambda (i) (+ i 1)) n))

(define (numer-term n)
    (cond ((= n 1) 2)
          ((even? n) (+ n 2))
          (else (+ n 1))))

(define (denom-term n)
    (if (odd? n)
        (+ n 2)
        (+ n 1)))

(define (even? n)
  (= (remainder n 2) 0))

(define (odd? n)
   (= (remainder n 2) 1))  

(define (pi n) 
    (* 4
        (exact->inexact (/ (product numer-term 1 (lambda (x) (+ x 1)) n)
                           (product denom-term 1 (lambda (x) (+ x 1)) n)))))

(pi 10)

;; 下面是错误的 已废除
(define (product a b)
    (define (even a) 
        (* a (+ a 2)))    
    (define (odd x) ( square x))
    (* 4 (exact->inexact (/ (sum even a inc b) (sum odd (+ a 1) inc b)))))

(define (inc n) (+ n 2))
(define (square x) (* x x))

;计算出这个 396.2872260015117 
(product 2 10)