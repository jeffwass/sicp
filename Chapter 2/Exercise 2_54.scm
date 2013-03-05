#lang planet neil/sicp
; SICP 2.54

(define (equal? a b)
  (cond ((and (null? a) (null? b))
         true)
        ((pair? a)
         (if (not (pair? b))
             false
             (if (equal? (car a) (car b))
                 (equal? (cdr a) (cdr b))
                 false)))
        ((pair? b) false)
        (else (eq? a b))))
         
(equal? (list 1 3 (list 7 2))
        (list 1 3 (list 7 2)))
(equal? (list 1 3 (list 7 2))
        (list 1 3 (list 8 2)))
