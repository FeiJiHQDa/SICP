(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (car-n seqs))
            (accumulate-n op init (cdr-n seqs)))))

(define (car-n x)
    (map car x))

(define (cdr-n x)
    (map cdr x))

(define (map proc items)
    (if (null? items)
        nil
        (cons (proc (car items))
              (map proc (cdr items)))))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))              

(define x (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))            


(map + (list 1 2 3) (list 40 50 60) (list 700 800 900))