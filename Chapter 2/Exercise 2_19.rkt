#lang planet neil/sicp
; SICP 2.19

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination
                 coin-values))
            (cc (- amount
                   (first-denomination
                    coin-values))
                coin-values)))))

(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (not (pair? coin-values)))

(define us-coins (list 100 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1))

(cc 100 us-coins) ;293
(cc 100 uk-coins) ;4563 (not using the farthing)

; Using a list now, order shouldn't matter since we keep track of the coin denominations,
; not the # of distinct coins as expected in a sorted list.  Very through a random ordering.
(cc 100 (list 1 10 25 5 50 100))