#lang planet neil/sicp
; SICP 2.23
(define (for-each func list)
  (if (not (null? list))
      (func (car list)))
  (if (null? list)
      true
      (for-each func (cdr list))))

(for-each (lambda (x) (newline) (display x)) (list 1 2 3 4 5))

