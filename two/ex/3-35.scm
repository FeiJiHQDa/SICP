#lang planet neil/sicp

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

;( 方法 一)
(define (count-leaves t)
    (accumulate (lambda (x y) (+ 1 y))  0 (enumerate-tree t)))

(define (enumerate-tree tree)
    (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

;方法三
(define (count-leaves2 t)
    (length (enumerate-tree tree)))

;(方法 二)
(define (count-leaves t)
    (accumulate +      ; 这里用加号
                0 
                (map (lambda (sun-tree) (if (pair? sun-tree)
                                            (count-leaves sun-tree)
                                            1)) 
                    t )))

(count-leaves2 (list (list 1 2) (list 3 4)))