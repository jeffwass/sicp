#lang planet neil/sicp
(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recursive term (next a) next b))))
(define (square x) (* x x)) 
(define (product-iterative term a next b)
  (define (product-iteration a result)
    (if (> a b)
        result
        (product-iteration (next a) (* result (term a)))))
  (product-iteration a 1))

; Factorial
(product-recursive (lambda (n) n) 1 (lambda (n) (+ 1 n)) 5)
(product-iterative (lambda (n) n) 1 (lambda (n) (+ 1 n)) 5)

; Move the 2 to denominator of LHS, can write as square of fractions (but divide by the last b)
(define (pi b)
  (* (square (product-iterative (lambda (n) (/ n (- n 1))) 4 (lambda (n) (+ n 2)) b)) (/ 8.0 b)))
(pi 100)                                                 
(pi 1000)
                                                  