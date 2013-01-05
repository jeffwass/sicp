#lang planet neil/sicp
; SICP 1.39

(define (tan-cf x k)
  (define (tan-cf-iter x k i accum)
    (if (= 1 i)
        (/ x (- 1 accum))
        (tan-cf-iter x k (- i 1) (/ (* x x) (- (* 2 i) 1 accum)))))
    (tan-cf-iter x k (- k 1) (/ (* x x) (- (* 2 k) 1))))
        
(define pi 3.1415926535897932384) ; enough digits so accuracy is restricted by the iterative approximation
(tan-cf (/ pi 4) 3) ; Should be 1
(tan-cf (/ pi 4) 8) ; Converges quickly
(tan (/ pi 4))      ; Compare to the built-in primitive
