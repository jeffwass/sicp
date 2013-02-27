#lang planet neil/sicp
; SICP 1.35
; The golden ratio phi is defined (phi / 1) = (1 / (1-phi))
; phi^2 - phi = 1
; phi = 1 + 1/phi

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)