#lang planet neil/sicp
; SICP 1.41
(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))
(define (square x) (* x x))
((double inc) 3) 
((double square) 3)

(((double (double double)) inc) 5)

