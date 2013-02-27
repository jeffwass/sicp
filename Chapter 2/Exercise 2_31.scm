#lang planet neil/sicp
;SICP 2.31

(define (tree-map func tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (func tree))
        (else (cons (tree-map func (car tree))
                    (tree-map func (cdr tree))))))

(define (square-tree tree) (tree-map (lambda (x) (* x x)) tree))

(display (square-tree (list 1
                           (list 2 (list 3 4) 5)
                           (list 6 7))))

                              