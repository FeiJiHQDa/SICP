#lang planet neil/sicp
(define balance 100)

(define (withdaw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))

(withdaw 25)
(withdaw 25)
(withdaw 25)
(withdaw 26)

(define withdaw1
    (let ((balance 100))
        (lambda (amount) 
            (if (>= balance amount)
                (begin (set! balance (- balance amount))
                       balance)
                "Insufficient funds"))))

(withdaw1 25)
(withdaw1 25)
(withdaw1 25)
(withdaw1 26)

(define (make-withdraw balance)
        (lambda (amount) 
            (if (>= balance amount)
                (begin (set! balance (- balance amount))
                       balance)
                "Insufficient funds")))
(define w1 (make-withdraw 100))
(define w2 (make-withdraw 100))

(w1 78)
(w2 30)
(w1 5)

(define (make-amount balance)
        (lambda (amount) 
            (if (>= balance amount)
                (begin (set! balance (- balance amount))
                       balance)
                "Insufficient funds")))