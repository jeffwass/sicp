#lang planet neil/sicp
; SICP 1.43
(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1))))) 
(define (compose f g)
  (lambda (x) (f (g x))))
(define (square x) (* x x))

((repeated square 2) 5) ;(5^2)^2
((repeated square 3) 2) ; (((2^2)^2)^2) =  