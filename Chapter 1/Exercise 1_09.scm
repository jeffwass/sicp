#lang planet neil/sicp
(define (+a a b)
  (if (= a 0) b (inc (+a (dec a) b))))
; (+a 2 3)
; (inc (+a 1 3))
; (inc (inc (+a 0 3)))
; (inc (inc 3))
; (inc 4)
; 5
; Recursive

(define (+b a b)
  (if (= a 0) b (+b (dec a) (inc b))))
; (+b 2 3)
; (+b 1 4)
; (+b 0 5)
; 5
; Iterative