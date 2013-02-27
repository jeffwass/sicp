#lang planet neil/sicp
(define x (list 1 2 3))
(define y (list 4 5 6))

(define q1 (append x y)) ; expect same as (list 1 2 3 4 5 6)
(equal? q1 (list 1 2 3 4 5 6))

(define q2 (cons x y)) 
(define q3 (list x y)) ; expect same as (cons x (cons y nil))
(equal? q3 (cons x (cons y nil)))


