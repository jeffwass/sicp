#lang planet neil/sicp

(define (sqrt-iter guess last-guess x)
  (if (good-enough? guess last-guess x)
      guess
      (sqrt-iter (improve guess x) guess x)))
(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))
(define (good-enough? guess last-guess x)
  (and 
    (> last-guess 0) 
    (< (abs (/ (- guess last-guess) x) ) 0.001)
    (< (abs (- guess last-guess) ) 0.001)
   )
 )
  
(define (sqrt x)
  (sqrt-iter 1.0 -1 x))