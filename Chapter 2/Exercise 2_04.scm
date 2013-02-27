#lang planet neil/sicp
;SICP 2.4
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

(define c (cons 3 5))
(car c)
(cdr c)
(define d (cons 4 c))
(car d)
(car (cdr d))
(cdr (cdr d))
