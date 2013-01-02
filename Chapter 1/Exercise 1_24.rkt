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
    (= (expmod a n n) a))
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
(define (square x) (* x x))

(find-primes 1000 3)
(find-primes 10000 3)
(find-primes 100000 3)
(find-primes 1000000 3)
(find-primes 10000000 3)

;1009 *** 55 -- 7.951751639058883
;1013 *** 58 -- 8.380689643251108
;1019 *** 59 -- 8.51791580704461(mcons (mcons (mcons '() 1009) 1013) 1019)

;10007 *** 68 -- 7.382445311469895
;10009 *** 67 -- 7.273722130618652
;10037 *** 68 -- 7.380046933479469(mcons (mcons (mcons '() 10007) 10009) 10037)

;100003 *** 83 -- 7.209269614199688
;100019 *** 85 -- 7.382884362783031
;100043 *** 85 -- 7.382730511617851(mcons (mcons (mcons '() 100003) 100019) 100043)

;1000003 *** 91 -- 6.586798211896407
;1000033 *** 92 -- 6.659166149897186
;1000037 *** 248 -- 17.95079051132664(mcons (mcons (mcons '() 1000003) 1000033) 1000037)

;10000019 *** 115 -- 7.134837075928692
;10000079 *** 114 -- 7.072792381548059
;10000103 *** 115 -- 7.134833357609305(mcons (mcons (mcons '() 10000019) 10000079) 10000103)