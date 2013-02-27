#lang planet neil/sicp
(define (a x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (a (- x 1) (a x (- y 1))))))
(define (f n) (a 0 n))
(define (g n) (a 1 n))
(define (h n) (a 2 n))

; (f n) = (a 0 n) = 2y

; (g n) = (a 1 n)
; By induction:
; (g 1) = (a 1 1) = 2
; (g 2) = (a 1 2) = (a 0 (a 1 1)) = (a 0 2) = 4
; (g n) = (a 1 n) = (a 0 (a 1 n-1)) = 2*(a 1 n-1) = 2^n

; (h n) = (a 2 n)
; (h 1) = (a 2 1) = 2
; (h 2) = (a 2 2) = (a 1 (a 2 1)) = (a 1 2) = (g 2) = 2^2 = 4;
; (h 3) = (a 2 3) = (a 1 (a 2 2)) = (a 1 (a 1 (a 2 1))) = (a 1 (a 1 2)) = (a 1 (g 2)) = (g (g 2)) = 2^(2^2) = 16;
; (h n) = (a 2 n) = (a 1 (a 2 n-1)) = (g (h n-1)) = 2^(h n-1) = 2^(2^(2^...))

