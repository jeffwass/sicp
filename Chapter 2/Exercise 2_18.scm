#lang planet neil/sicp
; SICP 2.18

(define (reverse list)
  (define (reverse-iter list out)
    (if (null? list)
        out
        (reverse-iter (cdr list) (cons (car list) out))))
  (reverse-iter list nil))
        
(reverse (list 1 4 9 16 25))
(list 25 16 9 4 1)