#lang planet neil/sicp
;SICP 2.21

(define (square x) (* x x))
(define (square-list-a items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list-a (cdr items)))))
(define (square-list-b items)
  (map square items))

(define test-list (list -1 0 1 2 3 16))
(define a-out (square-list-a test-list))
(define b-out (square-list-b test-list))
a-out
b-out
(equal? a-out b-out)
