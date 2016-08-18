(define w (cons 1 (cons 3 (cons (list 6 7) 9))))

(define s (list 1 2 3 4 5 (cons 6 7)))


(define x (list 1 3 (list 5 7) 9))
(cdr (cdr x)

; 2-25解答
(define x (list 1 3 (list 5 7) 9))
x

(car (cdr (car (cdr (cdr x)))))
(car (cdaddr x))

(define y (list 1 (list 2 (list 3 (list 4 )))))

(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(cadadr (cadadr (cadadr z)))