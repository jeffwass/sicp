#lang planet neil/sicp
; SICP 2.18

(define (last-pair x)
  (define (last-pair-iter a b)
    (if (null? b)
        (list a)
        (last-pair-iter (car b) (cdr b))))
  (last-pair-iter (car x) (cdr x)))


(define (reverse x)
  (define (reverse-iter old new)
    (if (null? old)
        new
        (reverse-iter (cdr old) (cons (car old) new))))
    (reverse-iter x nil))
        
(reverse (list 1 4 9 16 25))
(list 25 16 9 4 1)