(define (scale-list items factor)
    (if (null? items)
        nil
        (cons (* (car items) factor)
              (scale-list (cdr items) factor))))

(define w (list 1 2 3 4 4 9 88))

(scale-list w 2)

(define (map proc items)
    (if (null? items)
        nil
        (cons (proc (car items))
              (map proc (cdr items)))))

(map abs (list -10 20 -99 -11.3 88))

(map (lambda (x) (* x x *)) (list -10 20 -99 -11.3 88))