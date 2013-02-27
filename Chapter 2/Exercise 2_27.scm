#lang planet neil/sicp
; SICP 2.27
(define (reverse list)
  (define (reverse-iter list out)
    (if (null? list)
        out
        (reverse-iter (cdr list) (cons (car list) out))))
  (reverse-iter list nil))

        

(define (deep-reverse list)
  (define (reverse-iter list out)
    (cond ((null? list) out)
          ((pair? (car list)) (reverse-iter (cdr list) (cons (deep-reverse (car list)) out)))
          (else (reverse-iter (cdr list) (cons (car list) out)))))
  (reverse-iter list nil))

(define x (list (list 1 2) (list 3 4)))
(display x)(newline)
(display (reverse x))(newline)
(display (deep-reverse x))(newline)

(define y (list x 2 (list x x)))
(display y)(newline)
(display (deep-reverse y))