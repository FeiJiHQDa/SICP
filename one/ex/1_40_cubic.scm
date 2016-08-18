;;;;;;;;;;;;;;;;;;; 1_40 的答案 ;;;;;;;;;;

(define (cubic a b c)
    (lambda (x)
        (+ (cube x)
            (* a (square x))
            (* b x)
            c)))

; 测试例子
 (newton-method (cubic 3 2 1) 1.0)