
(define (filter predicate sequence)
    (cond ((null? sequence) nil)
          ((predicate (car sequence))
           (cons (car sequence)
                (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))

(define w (list 2 3 4 5 6 7 8))

(define (same-parity sample . others)
    (filter (if (even? sample)
                even?
                odd?)
            (cons sample others)))

; 一些我的作答, 不成功
(define (same-parity list)
    (cond ((null? list) 0)
          ((even? (car list)) (first-even list))
          (else (odd? (car list)) (first-odd list))))

(define (even? n)
    (= (remainder n 2) 0))

(define (odd? n)
    (= (remainder n 2) 1))

; 这个得到的是 (mcons #t (mcons #f (mcons #t (mcons #f 0))))
(define (first-even data-list)
    (if (null? data-list)
        0
        (cons (even? (car data-list)) (first-even (cdr data-list)))))


(define (first-odd data-list)
    (if (null? data-list)
        0
        (cons (odd? (car data-list)) (first-odd (cdr data-list)))))