
(define (equal? list1 list2)
    (cond ((and (not (pair? list1)) (not (pair? list2)))
            (eq? list1 list2))
          ((and (pair? list1) (pair? list2))
            (and (equal? (car list1) (car list2)) (equal? (cdr list1) (cdr list2))))
          (else false)))

(equal? '(this is a list) '(this is a list1)) ;#f
 (equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5) 6))     ;#t
(equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5 7) 6))     ;#f       