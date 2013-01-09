#lang planet neil/sicp
;SICP 2.14
(define (make-interval a b) (cons a b))
(define (upper-bound x)
  (max (car x) (cdr x)))
(define (lower-bound x)
  (min (car x) (cdr x)))
(define (div-interval x y)
     (mul-interval
      x
      (make-interval (/ 1.0 (upper-bound y))
                     (/ 1.0 (lower-bound y)))))
(define (mul-interval x y)
     (let ((p1 (* (lower-bound x) (lower-bound y)))
           (p2 (* (lower-bound x) (upper-bound y)))
           (p3 (* (upper-bound x) (lower-bound y)))
           (p4 (* (upper-bound x) (upper-bound y))))
       (make-interval (min p1 p2 p3 p4)
                      (max p1 p2 p3 p4))))
(define (center x)
  (/ (+ (upper-bound x) (lower-bound x)) 2))
(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))
(define (percent x)
  (/ (width x) (center x) 1.0 ))


(define a (make-interval 9 11))
(define b (make-interval 49 51))
(define c (make-interval 49.99 50.01))
(define a-over-a (div-interval a a))
(define b-over-b (div-interval b b))
(define c-over-c (div-interval c c))
(define a-over-b (div-interval a b))
(define a-over-c (div-interval a c))

a-over-a ; 1 but a wide interval (0.82 1.22)
b-over-b ; 1 but a narrower interval (0.96 1.04)
c-over-c ; 1 with even narrower interval (0.9996 1.0004)
(center b)
(center c) ; same centers for b and c
(center a-over-b) 
(center a-over-c) ;different centers for the quotient