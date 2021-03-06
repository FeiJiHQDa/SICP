(define (count-change amount) (cc amount 5))
(define (cc account kinds-sum)
    (cond ((= account 0) 1)
          ((or (< account 0) (= kinds-sum 0)) 0)
          (else (+ (cc account (- kinds-sum 1))
                   (cc (- account (first-denomination kinds-sum)) kinds-sum)))))

(define (first-denomination x) 
    (cond ((= x 1) 1)
          ((= x 2) 5)
          ((= x 3) 10)
          ((= x 4) 25)
          ((= x 5) 50)))

(count-change 100)