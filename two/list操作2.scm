(define x (cons (list 1 2) (list 3 4)))  ; 这相当与树

;计算数量
(define (count-leaves x)
    (cond ((null? x) 0)
          ((not (pair? x)) 1) ;不是序对就为1 , 因为null? 检测了x
          (else (+ (count-leaves (car x))
                    (count-leaves (cdr x))))))

; 处理不为二叉树的情况, 反转叉树
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

(count-leaves x)

; tree 的四折运算
(define (scale-tree tree factor)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (* tree factor))
          (else (cons (scale-tree (car tree) factor)
                      (scale-tree (cdr tree) factor)))))
; map 树映射
(define (scale-tree tree factor)
    (map (lambda (sub-tree)
            (if (pair? sub-tree)
                (scale-tree sub-tree factor)
                (* sub-tree factor))) 
        tree))

;map square 
(define (scale-list tree)
    (map (lambda (sub-tree)
          (if (pair? sub-tree)
                (scale-list sub-tree)
              (square sub-tree)))
          tree))       