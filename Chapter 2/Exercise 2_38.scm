#lang planet neil/sicp
;SICP 2.38

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
; These are the same constructs in order
(/ 1 (/ 2 (/ 3 1)))
(/ (/ (/ 1 1) 2) 3)

(display (fold-right list nil (list 1 2 3)))(newline)
(display (fold-left list nil (list 1 2 3)))(newline)
; The same constructs in order
(display (list 1 (list 2 (list 3 nil))))(newline)
(display (list (list (list nil 1) 2 ) 3))(newline)

;Should be the same when op is commutative.  Ie, (op a b) = (op b a)
(fold-right * 1 (list 1 2 3))
(fold-left * 1 (list 1 2 3))