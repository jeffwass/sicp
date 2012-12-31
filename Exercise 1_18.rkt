#lang planet neil/sicp
(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-mult (double a) (halve b)))
        (else (+ a (fast-mult a (- b 1))))))
(define (double a) (+ a a))
(define (halve a) (/ a 2))

;(fast-mult 3 7)
;(3 + (fast-mult 3 6)
;(3 + (fast-mult 6 3)
;(3 + 6 + (fast-mult 6 2))
;(3 + 6 + (fast-mult 12 1))
;(3 + 6 + 12 + (fast-mult 12 0))
;(3 + 6 + 12 + 0)
;21
