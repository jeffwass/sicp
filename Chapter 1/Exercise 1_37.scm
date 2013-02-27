#lang planet neil/sicp
; SICP 1.37

; Start at the top and work our way down
(define (cont-frac-recursive n d k)
  (define (cont-frac-recursor n d k i)
    (if (= i k) (/ (n k) (d k))
    (/ (n i) (+ (d i) (cont-frac-recursor n d k (+ 1 i))))))
  (cont-frac-recursor n d k 1))

; Start at the bottom and work our way up
(define (cont-frac-iterative n d k)
  (define (cont-frac-iter n d i accum)
    (if (= i 0)
        accum
        (cont-frac-iter n d (- i 1) (/ (n i) (+ (d i) accum)))))
  (cont-frac-iter n d (- k 1) (/ (n k) (d k))))

; The fraction as described in the problem is not phi, but phi - 1.
; Phi is defined as the infinite fraction :
; Phi = 1 + 1 / (1 + 1 / (1 + 1 / ...))
;     = 1 + 1 / Phi

; We converge to four decimals of precision after 12 tries.
(+ 1 (cont-frac-recursive (lambda (i) 1.0) (lambda (i) 1.0) 12))
(+ 1 (cont-frac-iterative (lambda (i) 1.0) (lambda (i) 1.0) 12))