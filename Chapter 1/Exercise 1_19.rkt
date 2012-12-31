#lang planet neil/sicp
; Best seen in matrix form
; T (a   =  (q+p  q (a
;    b)      q    p) b)
; T^2 = ((q+p)^2 + q^2  q(q+p) + qp
;        q(q+p) + qp    q^2 = p^2   )
;
; p' = q^2 + p^2
; q' = q^2 + 2pq

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a b (+ (square p) (square q)) (+ (square q) (* 2 p q)) (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q (- count 1)))))
(define (square x) (* x x))

;(fib 6)
;(fib-iter 1 0 0 1 6)
;(fib-iter 1 0 1 1 3)
;(fib-iter 2 1 1 1 2)
;(fib-iter 2 1 2 3 1)
;(fib-iter 15 8 2 3 0)
;8