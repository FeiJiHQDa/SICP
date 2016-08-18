
;; 迭代
; @ combiner * | +
; @ null-vlaue 0 | 1
;
(define (accumulate combiner null-value term a next b)
      (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner result (term a)))))
    (iter a null-value))

; 递归
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (sum combiner null-value term (next a) next b))))

(accumulate * 1 (lambda (i) i) 1 (lambda (i) (+ i 1)) 10) 