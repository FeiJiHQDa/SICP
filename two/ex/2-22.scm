(define (square x) (* x x))


(define (revese list)
    (revese-item list '()))
(define (revese-item one two)
    (if (null? one)
        two
        (revese-item (cdr one) (cons (car one) two))))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        (revese answer)
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))



; 2.23

;特殊形式 begin 可以确保多条表达式按顺序求值，它可以将多条表达式当作一条表达式来运行，因此可以用在只支持单条表达式的 if 形式里.
(define (for-each proc items)
    (if (not (null? items))
        (begin
        (proc (car items))
        (for-each proc (cdr items)))))

;;;;;;;;;;;;;; 这个不成功 ，因为 (+ 1 (+ 1 (+ 1)))
(define (for-each proc items)
    (if  (null? items)
        0
        (proc (car items)
        (for-each proc (cdr items)))))
;;;;;;;;;;;;;;;;;;;;;;;;+++++++++++++++++++++++++++++++++++

(define (for-each proc items)
    (cond ((not (null? items))
            (proc (car items))
            (for-each proc (cdr items)))))


(for-each (lambda (x) (newline) (display x))
           (list 57 321 88))        