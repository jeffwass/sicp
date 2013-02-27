#lang planet neil/sicp
; SICP 2.20

(define (filter list func)
  (cond ((null? list)
         list)
        ((if (func (car list))
              (cons (car list) (filter (cdr list) func))
              (filter (cdr list) func)))))
(define (same-parity t . r)
  (define func
    (if (even? t) even? odd?))
  (filter (cons t r) func))

(same-parity 1 2 3 4 5)
(same-parity 2 3 4 5 7 8 10 13 24)