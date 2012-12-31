#lang planet neil/sicp
(define (fast-expt b n)
  (expt-iter b n 1))
(define (expt-iter b counter product)
  (cond ((= counter 0) product)
        ((even? counter) (expt-iter (square b) (/ counter 2) product))
        (else (expt-iter b (- counter 1) (* product b)))))
(define (square x) (* x x))

      
      