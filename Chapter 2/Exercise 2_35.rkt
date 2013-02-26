#lang planet neil/sicp
;SICP 2.35

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (branch)
                         (cond ((null? branch) 0)
                               ((pair? branch) (count-leaves branch))
                               (else 1))) t)))

(count-leaves '(1 2 3))
(count-leaves '(1 (2 3) (4 (1 3)) 3 (1 (3 (4 99 3)))))