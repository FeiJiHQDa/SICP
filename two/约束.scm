#lang planet neil/sicp

(define (square x) (* x x))

(define (even? n)
    (= (remainder n 2) 0))

(define (odd? n)
    (= (remainder n 2) 1)) 

;  树奇数的叶子的平方和
(define (sun-odd-square tree)
    (cond ((null? tree) 0)
          ((not (pair? tree)) 
            (if (odd? tree) (square tree) 0))
          (else (+ (sun-odd-square (car tree))
                    (sun-odd-square (cdr tree))))))
; 运行例子
(define x (list (list 1 2) (list 3 34)))

(sun-odd-square x)  

; 偶数的fib
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (even-fibs n)
    (define (next k)
        (if (> k n)
            nil
            (let ((f (fib k)))
                (if (even? f)
                    (cons f (next (+ k 1)))
                (next (+ k 1))))))
    (next 0))
;例子
(even-fibs 12)


; 真正的模块话

; 赛选模块
(define (filter predicate sequence)
    (cond ((null? sequence) nil)
          ((predicate (car sequence))
            (cons (car sequence)
                  (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))

; 累计模块
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

; 枚举模块
; list
(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))))
;树 枚举
(define (append list1 list2) ; 合并
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(define (enumerate-tree tree)
    (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

; 使用 模块
(define (sum-odd-squares tree)
    (accumulate +
                0
                (map square
                    (filter odd?
                            (enumerate-tree tree)))))

(define (even-fibs n)
    (accumulate cons
                nil
                (filter even?
                        (map fib
                             (enumerate-interval 0 n)))))
; 将fib 全部 square
(define (squers-even-fibs n)
    (accumulate cons
                nil
                (map square
                        (map fib
                             (enumerate-interval 0 n)))))

(define (product-of-squares-of-odd-elements sequence)
    (accumulate *
                1
                (map square
                    (filter odd? sequence))))

(define (salary-of-highest-paid-programmer records)
    (accumulate max
                0
                (map salary
                    (filter programmer? records))))