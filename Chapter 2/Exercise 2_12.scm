#lang planet neil/sicp
; SICP 2.12
(define (make-interval a b) (cons a b))
(define (upper-bound x)
  (max (car x) (cdr x)))
(define (lower-bound x)
  (min (car x) (cdr x)))
(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))
(define (center x)
  (/ (+ (upper-bound x) (lower-bound x)) 2))
(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))
(define (percent x)
  (/ (width x) (center x) 1.0 ))

(define a (make-interval 8 12))
(define b (make-center-percent 10 0.2))
a
b
(display (percent a))(newline)
(display (percent b))(newline)
         
                               
         