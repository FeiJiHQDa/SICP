;  这事递归
(define (kps row col)
    (cond ((> col row) (error "unvalid col value"))
          ((or (= col 0) (= col row)) 1)
          (else (+ (kps (- row 1) (- col 1))
                    (kps (- row 1) col)))))


;(row col)= row! / col!⋅(row−col)!        

;  下面是迭代, 对于如何的增长都可以用 factorial

(define (factorial n)
      (fact-iter 1 1 n))
(define (fact-iter prodct count max-count)
        (if (> count max-count)
            prodct
            (fact-iter (* prodct count)
                    (+ count 1)
                    max-count)))            


(define (pacse row col)
        (/ (factorial row)
            (* (factorial col)
                (factorial (row - col)))))