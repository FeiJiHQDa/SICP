(define (revese list)
    (revese-item list '()))
(define (revese-item one two)
    (if (null? one)
        two
        (revese-item (cdr one) (cons (car one) two))))

; 错误
(define (deep-revese list)
    (cond ((null? list) 0)
          ((not (pair? list)) car list)
          (else (cons (deep-revese (cdr list)) (deep-revese (car list))))))


;http://community.schemewiki.org/?sicp-ex-2.27   varoun

(define (deep-revese list)
    (define (iter t result)
        (cond ((null? t) result)
              ((not (pair? (car t)))
               (iter (cdr t) (cons (car t) result)))
              (else (iter (cdr t) (cons (deep-revese (car t)) result)))))
    (iter list '()))

; 国内版
(define (deep-revese tree)
    (cond ((null? tree) 
            '())
          ((not (pair? tree)) 
            tree)
          (else (revese (list (deep-revese (car tree))
                                   (deep-revese (cadr tree)))))))

; 改进版
(define (deep-revese tree)
    (cond ((empty-tree? tree) 
            '())
          ((leaf? tree) 
            tree)
          (else (revese (make-tree (deep-revese (left-branch  tree))
                                   (deep-revese (right-branch  tree)))))))

(define (empty-tree? tree)
    (null? tree))
(define (leaf? tree)
    (not (pair? tree)))
(define (make-tree  left-branch  right-branch )
    (list left-branch  right-branch ))
(define (left-branch tree)
    (car tree))
(define (right-branch tree)
    (cadr tree))

; 处理不为二叉树的情况
(define (tree-reverse tree)
    (define (iter remained-items result)
        (if (null? remained-items)
            result
            (iter (cdr remained-items)
                  (cons (if (pair? (car remained-items))    ;如果是序对, 再递归 branch
                            (tree-reverse (car remained-items))
                            (car remained-items))
                        result))))
    (iter tree '()))

(define x (list (list 1 2) (list 3 4)))

(revese x)

(define x (list (list 1 2) (list 3 4)))

(define (tree-reverse tree)
    (define (iter remained-items result)
        (if (null? remained-items)
            result
            (iter (cdr remained-items)
                  (cons (if (pair? (car remained-items))    ;如果是序对, 再递归 branch
                            (tree-reverse (car remained-items))
                            (car remained-items))
                        result))))
    (iter tree '()))