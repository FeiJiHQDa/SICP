
(define (square x) (* x x))
;; Logarithmic iteration
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))


(define (cons x y)
    (* (fast-expt 2 x)
        (fast-expt 3 y)))

(define x (cons 3 2))

x

; 例如 cons 是 8  dir 从 72 / 3 / 3 = 8, 将自己的内容除玩， +1
(define (car z)
    (if (= (remainder z 2) 0)
        (+ 1 (car (/ z 2)))
        0))
(define (cdr z)
    (if (= (remainder z 3) 0)
        (+ 1 (cdr (/ z 3)))
        0))
(cdr x)