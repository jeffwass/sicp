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
  (if (fast-prime? n 10) (report-prime n (- (runtime) start-time)) 0))
(define (report-prime n elapsed-time)
  (newline) (display n) (display " *** ") (display elapsed-time) (display " -- ") (display (/ elapsed-time (log n))) 1)
(define (fermat-test n)
  (define (try-it a)
    (= (expmod2 a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))
(define (expmod2 base exp m) (remainder (fast-expt base exp) m))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define (square x) (* x x))

(find-primes 1000 3)
(find-primes 10000 3)
(find-primes 100000 3)
(find-primes 1000000 3)
(find-primes 10000000 3)

; Significantly slower, even slower than sqrt(n)
; I stopped during the 1,000,000 process block.
; As explained in footnote 1.46, we spend time calculating the exponential that is not needed.

;1009 *** 357 -- 51.614097002618564
;1013 *** 322 -- 46.5272769849458
;1019 *** 427 -- 61.6466110103059(mcons (mcons (mcons '() 1009) 1013) 1019)

;10007 *** 16729 -- 1816.1901119938216
;10009 *** 19097 -- 2073.2279332600656
;10037 *** 26353 -- 2860.093777029183(mcons (mcons (mcons '() 10007) 10009) 10037)

;100003 *** 817674 -- 71022.0761749532
;100019 *** 763838 -- 66345.03089293488
;100043 *** 716107 -- 62197.94115862499(mcons (mcons (mcons '() 100003) 100019) 100043)