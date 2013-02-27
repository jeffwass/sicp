#lang planet neil/sicp
; SICP 2.10
(define (make-interval a b) (cons a b))
(define (upper-bound x)
  (max (car x) (cdr x)))
(define (lower-bound x)
  (min (car x) (cdr x)))
(define (mul-interval x y)
     (let ((p1 (* (lower-bound x) (lower-bound y)))
           (p2 (* (lower-bound x) (upper-bound y)))
           (p3 (* (upper-bound x) (lower-bound y)))
           (p4 (* (upper-bound x) (upper-bound y))))
       (make-interval (min p1 p2 p3 p4)
                      (max p1 p2 p3 p4))))
(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0) ; different signs
      nil
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(define a (make-interval 3 5))
(define b (make-interval -2 2))
(define c (make-interval 3 -3))

(div-interval a b)
(div-interval a a)
