
;; 迭代
; @ combiner * | +
; @ null-vlaue 0 | 1
;


; 递归
(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
        (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter))  ;ok执行这条 
        (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter))))) ; NO 执行 combiner null-value


; 检查素数
(define (smallest-divisor n)
    (find-divisor n 2 ))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))    


(define (divides? a b) (= (remainder b a) 0))
(define (square n) (* n n))

(define (prime? n) (= n (smallest-divisor n)))

; 建立多一成抽象
(define (primes-sum a b)
  (filtered-accumulate + 0 (lambda (x) x) a (lambda (i) (+ i 1)) b prime?))

; 求 素数
(primes-sum 1 100)

; gcd 
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (coprime i n)
  (and (> i 0)
       (= 1 (gcd i n))))
;(coprime 4 3)
(define (product-of-coprimes n)
  (filtered-accumulate * 1 (lambda (x) x) 1 (lambda (i) (+ i 1)) n (lambda (x) (coprime x n))))     

(product-of-coprimes 10)