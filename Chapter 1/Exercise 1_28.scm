#lang planet neil/sicp

(define (miller-rabin-test n a)
  (= (expmod a n (- n 1) n) 1))
(define (expmod base n exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (if (trivial-square-root n base) 0 (remainder (square (expmod base n (/ exp 2) m)) m)))
        (else (remainder (* base (expmod base n (- exp 1) m)) m))))
(define (square x) (* x x))
(define (test-carmichael n)
  (test-carmichael-iter n 2))
(define (test-carmichael-iter n a)
  (cond ((= a (- n 1)) true)
        ((not (miller-rabin-test n a)) false)
        (else (test-carmichael-iter n (+ 1 a)))))
(define (trivial-square-root n a)
  (cond ((= a 1) true)
        ((= a (- n 1)) true)
        ((= (remainder (square a) n) 1) true)
        (else false)))

; All are false except the actual prime (17) below
(test-carmichael 1105)
(test-carmichael 1729)
(test-carmichael 2465)
(test-carmichael 2821)
(test-carmichael 6601)
(test-carmichael 17)
(test-carmichael 18)
