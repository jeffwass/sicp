#lang planet neil/sicp
(define (f g) (g 2))
(define (square x) (* x x))
(f square)
(f (lambda (z) (* z (+ z 1))))

; cannot call (f f), as (f 2) is not well-defined.