#lang planet neil/sicp

(define (cuberoot-iter guess last-guess x)
  (if (good-enough? guess last-guess x)
      guess
      (cuberoot-iter (improve guess x) guess x)))
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
(define (good-enough? guess last-guess x)
  (and 
    (> last-guess 0) 
    (< (abs (/ (- guess last-guess) x) ) 0.001)
    (< (abs (- guess last-guess) ) 0.001)
   )
 )
  
(define (cuberoot x)
  (cuberoot-iter 1.0 -1 x))