(define (list-ref items n)
    (if (= n 0)
        (car item)
        (list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))
(define list1 (list 99 88 77 66 55 44 33 22 11))
(list-ref squares 3)
; 其过程等于 (car (cdr (cdr (cdr squares))))

(define (lenght items)
    (if (null? items)
        0
        (+ 1 (lenght (cdr items)))))
(lenght squares)
; 其过程等于(+ 1 (+ 1 (+ 1 (+ 1 (+ 1)))))

; 上面是递归， 下面是 迭代

(define (lenght2 items)
    (define (lenght-iter a count)
        (if (null? a)
            count
            (lenght-iter (cdr a) (+ 1 count))))
    (lenght-iter items 0))

; 下面使用了 (cons 4 (cons 19 (cons 99 squares))) 这样的特性
(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(append list1 squares)


;2.17
(define (last-pair s)
    (let ((size (- (lenght2 s) 1)))
        (list-ref s size)))

(last-pair list3)

;2.18  排序相反
(define (revese list)
    (revese-item list '()))
(define (revese-item one two)
    (if (null? one)
        two
        (revese-item (cdr one) (cons (car one) two))))

(revese list3)

; map 映射
(define (square-list data)
    (map (lambda (x) (* x x)) data))

(define (map proc items)
    (if (null? items)
        nil
        (cons (proc (car items))
              (map proc (cdr items)))))