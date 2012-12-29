#lang planet neil/sicp
(define (new-if predicate consequent alternative)
  (cond (predicate consequent)
        (else alternative)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))
(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.000001))
(define (sqrt x)
  (sqrt-iter 1.0 x))