#lang planet neil/sicp
(define (map p sequence)
    (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
    (accumulate cons seq2 seq1))

(define (length sequence)
    (accumulate (lambda (x y) (+ 1 y))  0 sequence))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))




(define (count-leaves x)
    (cond ((null? x) 0)
          ((not (pair? x)) 1) ;不是序对就为1 , 因为null? 检测了x
          (else (+ (count-leaves (car x))
                    (count-leaves (cdr x))))))    