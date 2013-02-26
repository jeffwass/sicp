#lang planet neil/sicp
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

(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(display (reverse-right '(1 2 3 4 5)))(newline)
(display (reverse-left '(1 2 3 4 5)))