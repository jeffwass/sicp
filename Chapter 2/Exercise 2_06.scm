#lang planet neil/sicp
; SICP 2.6
;(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n) 
  (lambda (f) (lambda (x) (f ((n f) x)))))

; Simplify a bit
(define identity (lambda (x) x))
(define zero (lambda (f) identity))

; define one via substitution, in repeatedly-simpler steps
(define one-a (lambda (f) (lambda (x) (f (((lambda (f) identity) f) x)))))
(define one-b (lambda (f) (lambda (x) (f (identity x)))))
(define one-c (lambda (f) (lambda (x) (f x))))

; From here, it's a bit easier to see how to progress
(define two (lambda (f) (lambda (x) (f (f x)))))

; Plus (ie, adding N) is repeatedly composing f( ) to the terms N times.

(define inc (lambda (x) (+ x 1)))
(define one (add-1 zero))
((zero inc) 0)
((one inc) 0)
((one-a inc) 0)
((one-b inc) 0)
((one-c inc) 0)

(define (add m n) 
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(define three (add one two))
(define six (add three three))
(define nine (add six three))
((three inc) 0)
((six inc) 0)
((nine inc) 0)