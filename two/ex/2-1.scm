; 对于原来的 make-rat 不错处理 第二个实参 为负数

(define (make-rat n d)
  (let ((s (gcd n d)))
    (if (< d 0)
        (cons (- n) (- d))
    (cons n d))))     ; 对应 make-rat


;  DrRacket 支持 n & d 使用 负数形势