#lang planet neil/sicp
(define (square x) (* x x))
(define (sum-of-squares a b) (+ (square a) (square b) ) )
(define (myproc a b c)
  (if (> a b)(if (> b c) (sum-of-squares a b) (sum-of-squares a c) )
      (if( > a c ) (+ (square a) (square b) ) (+ (square b) (square c)))))
  
  

