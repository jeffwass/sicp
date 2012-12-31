#lang planet neil/sicp
; part a, prints the recursive iteration
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine theta)
  (define (sine-iter theta count)
    (display count) (newline)
    (if (not (> (abs theta) 0.1))
      theta
      (p (sine-iter (/ theta 3.0) (+ count 1)))))
  (sine-iter theta 1))
  
; part b
; Assume k steps, k((sine 3a)) = k((sine a))+1, -> O(log a)

