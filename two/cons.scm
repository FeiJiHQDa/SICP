(define x (cons 1 2))

(define y (cons 3 4))

(define z (cons x y))

(car (car z))
(car (cdr z))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((s (gcd n d)))
    (cons n d)))     ; 对应 make-rat

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
 
 ;测试 print-rat 的数据
(define make-one (make-rat 2 3))
(print-rat make-one)

(define make-twe (make-rat 4 2))

(print-rat (add-rat make-one make-twe))

(print-rat (mul-rat make-one make-twe))

; 下面定义一个 cons
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 ---CONS" m))))
  dispatch)

(define (car z) (z 0))
(define (cdr z) (z 1))

