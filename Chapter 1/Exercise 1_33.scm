#lang planet neil/sicp

; It seems here that the filter acts on a, not (term a).  In 1.32 I wrote the filter to operate on (term a)
(define (filtered-accumulate combiner keep-filter null-value term a next b)
  (define (accum-iter a result)
    (if (> a b)
        result
        (accum-iter (next a) (combiner 
                              (if 
                               (keep-filter a)
                               (term a)
                               null-value)
                              result))))
    (accum-iter a null-value))
(define (square x) (* x x))

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
   (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0 ))
(define (prime? n)
  (= n (smallest-divisor n)))

(filtered-accumulate (lambda (a b) (+ a b)) prime? 0 square 1 (lambda (n) (+ 1 n)) 10)
(filtered-accumulate (lambda (a b) (* a b)) prime? 1 (lambda (n) n) 1 (lambda (n) (+ 1 n)) 10)