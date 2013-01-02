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
          (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0 ))
(define (prime? n)
  (= n (smallest-divisor n)))
(define (square x) (* x x))

(find-primes 1000 3)
(find-primes 10000 3)
(find-primes 100000 3)
(find-primes 1000000 3)
(find-primes 10000000 3)

; Output
;1009 *** 7 -- 0.048562933597621406
;1013 *** 7 -- 0.04837117472852912
;1019 *** 7 -- 0.04808635917566242(mcons (mcons (mcons '() 1009) 1013) 1019)

;10007 *** 22 -- 0.04836614369941041
;10009 *** 23 -- 0.05285243281047058
;10037 *** 21 -- 0.043937431503437284(mcons (mcons (mcons '() 10007) 10009) 10037)

;100003 *** 70 -- 0.048998530044098675
;100019 *** 66 -- 0.04355172517221728
;100043 *** 66 -- 0.04354127725078216(mcons (mcons (mcons '() 100003) 100019) 100043)

;1000003 *** 227 -- 0.05152884541346376
;1000033 *** 219 -- 0.0479594173392278
;1000037 *** 339 -- 0.11491674808032103(mcons (mcons (mcons '() 1000003) 1000033) 1000037)

;10000019 *** 685 -- 0.04692241084741939
;10000079 *** 793 -- 0.06288440321321462
;10000103 *** 658 -- 0.04329595405167327(mcons (mcons (mcons '() 10000019) 10000079) 10000103)