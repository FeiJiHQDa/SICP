(define (average-damp f)        ; 平均阻尼函数
    (lambda (x)
        (average x (f x))))