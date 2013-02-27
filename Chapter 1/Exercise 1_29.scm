#lang planet neil/sicp
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (coefficient n k)
    (cond ((= 1 k) 1.0)
          ((= n k) 1.0)
          ((even? k) 2.0)
          (else 4.0)))
  (define (y a k h f) (f (+ a (* k h))))
  (define (simpson-iter f a b n k accum)
    ;(display k) (display "  ") (display accum) (newline)             
    (if (> k n)
        (* accum (/ h 3))
        (simpson-iter f a b n (+ 1 k) (+ accum (* (y a k h f) (coefficient n k)))))) 
  (simpson-iter f a b n 0 0))
(define (cube x) (* x x x))
(define (ninth-power x) (* x x x x x x x x x))

;; Simpson's Rule implicitly uses cubic interpolation, and so using x^3 is a poor choice to test convergence 
;(it converges too quickly).  So I'm using x^9 as a test (should be 0.1)
(integral ninth-power 0 1 0.1)
(integral-simpson ninth-power 0 1 10)
(integral ninth-power 0 1 0.01)
(integral-simpson ninth-power 0 1 100)
(integral ninth-power 0 1 0.001)
(integral-simpson ninth-power 0 1 1000)
; The output.  Simpson's method at 100 steps is better than linear finite element sum at 1000 steps
;0.09631076711328113
;0.1002701259
;0.09996250612451618
;0.10000002799000128
;0.09999962500061321
;0.1000000000028
