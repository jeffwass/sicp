#lang planet neil/sicp
;SICP 2.32

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))       
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(display (subsets (list 1 2 3)))
; Outputs (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

; The list of subsets of a set is collectin of all subsets excluding the first element, and all subsets including the first element.
; If we have the list of all subsets excluding the first element (defined as rest), then the set of all subsets is
; the concatenation of 'rest' with every element of rest including the first element as well.