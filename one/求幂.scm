; 递归求幂
(define (expt b n)
    (if (= n 0)
         1
        (* b (expt b (- n 1)))))

; 迭代求幂
(define (expt b n)
    (expt-iter b n 1))
(define (expt-iter base count product)
    (if (= count 0)
        product
        (expt-iter base
                   (- count 1)
                   (* base product))))

; 求幂算法

(define (fast-expt b n) 
    (cond ((= n 0) 1)
          ((evet? n) (square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1))))))

(define (evet? n)
    (= (remainder n 2) 0))

(define (square x) (* x x))    



; 1_16 求幂

(define (fast-expt-two b n)
    (cond ((= n 0) 1)
          ((evet? n) (expt2-iter b n 1))
          (else (expt b n))))

(define (expt2-iter base count product)
         (expt2-iter base (/ count 2) (square base)))     
         