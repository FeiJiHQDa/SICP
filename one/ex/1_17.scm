; 求乘机

;(define (expt b n)
;    (cond ((= n 0) 0))
;          ((even? n) (expt (double b) (halve n))))


(define (evet? n)
    (= (remainder n 2) 0))
(define (double b) (* b 2))
(define (halve n) (/ n 2))          

(define (multi a b)
    (cond ((= b 0) 0)
          ((evet? b) (double (multi a (halve b))))
          (else (+ a (multi a (- b 1))))))