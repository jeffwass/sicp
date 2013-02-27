#lang planet neil/sicp
;SICP 2.02
(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))
(define (midpoint-segment s)
  (let ((x1 (x-point (start-segment s)))
        (y1 (y-point (start-segment s)))
        (x2 (x-point (end-segment s)))
        (y2 (y-point (end-segment s))))
    (make-point (/ (+ x1 x2) 2) (/ (+ y1 y2) 2))))
        
(define start (make-point 2 10))
(define end (make-point 5 25))
(define segment (make-segment start end))
(print-point (start-segment segment))
(print-point (end-segment segment))
(print-point (midpoint-segment segment))

