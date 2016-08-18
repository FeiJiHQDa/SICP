; 比我写的要好很多

(define (fast-expt b n)
    (expt-iter2 b n 1))      

(define (expt-iter2 b n a)
    (cond ((= n 0)
          a)
          ((evet? n) (expt-iter2 (square b) (/ n 2) a))
          (else (expt-iter2 b (- n 1) (* b a))))) 


(define (evet? n)
    (= (remainder n 2) 0))

(define (square x) (* x x))  

(fast-expt 2 11)