#lang planet neil/sicp
(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-recursive combiner null-value term (next a) next b))))

(define (accumulate-iterative combiner null-value term a next b)
  (define (accum-iter a result)
    (if (> a b)
        result
        (accum-iter (next a) (combiner (term a) result))))
    (accum-iter a null-value))
      
; Show sum of 2 to 9, and product of 5 factorial
(accumulate-iterative (lambda (a b) (+ a b)) 0 (lambda (n) n) 2 (lambda (n) (+ 1 n)) 9)
(accumulate-iterative (lambda (a b) (* a b)) 1 (lambda (n) n) 1 (lambda (n) (+ 1 n)) 5)

(accumulate-recursive (lambda (a b) (+ a b)) 0 (lambda (n) n) 2 (lambda (n) (+ 1 n)) 9)
(accumulate-recursive (lambda (a b) (* a b)) 1 (lambda (n) n) 1 (lambda (n) (+ 1 n)) 5)