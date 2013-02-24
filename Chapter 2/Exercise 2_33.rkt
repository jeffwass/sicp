#lang planet neil/sicp
;SICP 2.33

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(display (map (lambda (x) (* x x)) (list 1 2 3 4 5)))
(newline)

(display (append (list 1 2 3 4) (list 5 6)))
(newline)

(length (list 1 1 2 3 5 8 13))
