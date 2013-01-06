#lang planet neil/sicp
;SICP 2.5

;2 and 3 are both prime, there is no ambiguity for any such number what a and b are.
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
(define (iter accum base n)
  (if (= 0 (remainder accum base))
      (iter (/ accum base) base (+ n 1))
      n))
(define (car x)
  (iter x 2 0))
(define (cdr x)
  (iter x 3 0))

(define x (cons 4 3))
(car x)
(cdr x)

(define y (cons 2 x))
y ; y is HUGE, even for only these small numbers
(car y)
(car (cdr y))
(cdr (cdr y))