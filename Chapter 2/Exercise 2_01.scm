#lang planet neil/sicp
;SICP 2.01

(define (make-rat n d)
  (let ((g (gcd n d))
        (sign-adj (if (equal? (> n 0) (> d 0)) 1 -1)))
    (cons (* sign-adj (abs (/ n g))) (abs (/ d g)))))
(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(print-rat (make-rat 3 9))
(print-rat (make-rat 3 -9))
(print-rat (make-rat -3 9))
(print-rat (make-rat -3 -9))