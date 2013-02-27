#lang planet neil/sicp
; SICP 2.37

(define (accumulate op init sequence)
  (if (null? sequence)
      init
       (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))


(define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define identity (list (list 1 0 0) (list 0 1 0) (list 0 0 1)))
(define n (list (list 1 0 0) (list 0 0 3) (list 0 2 0)))
(define v (list 10 11 12))
(display m)(newline)
(display v)(newline)
(display (matrix-*-vector m v))(newline)
(display (transpose m))(newline)
(display (matrix-*-matrix m identity))(newline)
(display (matrix-*-matrix m n))(newline)