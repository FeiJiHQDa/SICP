2-4

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))



;表达式 (car (cons 1 2)) 的展开序列如下：
;(car (cons 1 2))

;(car (lambda (m) (m 1 2)))          ; 展开 cons

;((lambda (z) (z (lambda (p q) p)))  ; 展开 car ，代换 z
;    (lambda (m) (m 1 2)))

;((lambda (m) (m 1 2))               ; 代换 m
;    (lambda (p q) p))

;((lambda (p q) p)                   ; 代换 p
;    1 2)

;1