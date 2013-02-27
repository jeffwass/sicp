#lang planet neil/sicp

(define (find-primes start count) (find-primes-iter start count nil))
(define (find-primes-iter n count list) 
  (if (< count 1) list 
  (if (= 1 (timed-prime-test n))
      (find-primes-iter (+ n 1) (- count 1) (cons list n))
      (find-primes-iter (+ n 1) count list))))
(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n) (report-prime n (- (runtime) start-time)) 0))
(define (report-prime n elapsed-time)
  (newline) (display n) (display " *** ") (display elapsed-time) (display " -- ") (display (/ (square (* 1.0 elapsed-time)) n)) 1)
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
   (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0 ))
(define (prime? n)
  (= n (smallest-divisor n)))
(define (square x) (* x x))
(define (next n) (if (= n 2) (+ n 1) (+ n 2)))

(find-primes 1000 3)
(find-primes 10000 3)
(find-primes 100000 3)
(find-primes 1000000 3)
(find-primes 10000000 3)

; Roughly half at low n, above half at high n.
; Implies not all computational time is taken by finding test divisors, so residual computations
; contribute to the baseline.