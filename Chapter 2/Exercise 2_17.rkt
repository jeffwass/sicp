#lang planet neil/sicp
;SICP 2.17

(define (last-pair x)
  (define (last-pair-iter a b)
    (if (null? b)
        (list a)
        (last-pair-iter (car b) (cdr b))))
  (last-pair-iter (car x) (cdr x)))

(last-pair (list 23 72 149 34))