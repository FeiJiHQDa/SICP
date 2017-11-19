#lang racket
(require racket/class racket/math racket/string racket/draw)

(define bitmap-size 4200)
(define font-size (/ bitmap-size 20))
(define yuan-1 2000)
(define yuan-2 1600)
(define yuan-3 1150)
(define yuan-4 750)
(define wu-xing "木火金水")
(define tian-gan '("甲乙" "丙丁" "庚辛" "壬癸"))
(define di-zhi "子丑寅卯辰巳午未申酉戌亥")

(define wu-xing-lie-biao-1 (reverse (filter (λ (x) (> (string-length x) 0))
                                            (string-split wu-xing ""))))

(define tian-gan-lie-biao-1 (reverse tian-gan))
(define tian-gan-shu (length tian-gan-lie-biao-1))

(define di-zhi-lie-biao-1 (reverse (filter (λ (x) (> (string-length x) 0))
                                           (string-split di-zhi ""))))
(define di-zhi-shu (length di-zhi-lie-biao-1))

(define text-target (make-bitmap bitmap-size bitmap-size))
(define dc (new bitmap-dc% [bitmap text-target]))

(send dc set-pen
      (send the-pen-list find-or-create-pen
            "blue" (/ bitmap-size 200) 'solid 'projecting))
(send dc set-brush "blue" 'transparent)
(send dc set-text-foreground "red")
(send dc set-font (make-object font% font-size 'roman))
(send dc set-origin (/ bitmap-size 2) (/ bitmap-size 2))

(define (draw-cricle ban-jing)
  (send dc draw-ellipse (- ban-jing) (- ban-jing) (* ban-jing 2) (* ban-jing 2)))

(draw-cricle yuan-1)
(draw-cricle yuan-2)
(draw-cricle yuan-3)
(draw-cricle yuan-4)

(send dc draw-text "戊 土 己" -450 -150)

(for ([i tian-gan-lie-biao-1]
      [j wu-xing-lie-biao-1])
  (begin (send dc draw-text
               i
               (- (* 1.3 font-size))
               (- (/ (+ yuan-3 yuan-4) 2) (* 0.7 font-size)))
         (send dc draw-text
               j
               (- (* 2/3 font-size))
               (- (/ (+ yuan-3 yuan-2) 2) (* 0.6 font-size)))
         (send dc rotate (/ pi tian-gan-shu))
         (send dc draw-line 0 yuan-4 0 yuan-2)
         (send dc rotate (/ pi tian-gan-shu))))

(send dc rotate (/ pi di-zhi-shu))
(for ([i di-zhi-lie-biao-1])
  (begin (send dc draw-text
               i
               (- (* 2/3 font-size))
               (- (/ (+ yuan-1 yuan-2) 2) (* 0.6 font-size)))
         (send dc rotate (/ pi di-zhi-shu 0.5))))

(send text-target save-file "wu-xing.png" 'png)