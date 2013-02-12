#lang planet neil/sicp
; SICP 2.28

(define (fringe mylist)
  (define left (if (pair? (car mylist))
                   (fringe (car mylist))
                   (list (car mylist))))
  (define right (if (null? (cdr mylist))
                    nil
                    (fringe (cdr mylist))))
  (append left right))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
