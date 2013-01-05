#lang planet neil/sicp
; SICP 1.38

; Start at the top and work our way down
(define (cont-frac-recursive n d k)
  (define (cont-frac-recursor n d k i)
    (if (= i k) (/ (n k) (d k))
    (/ (n i) (+ (d i) (cont-frac-recursor n d k (+ 1 i))))))
  (cont-frac-recursor n d k 1))

; Start at the bottom and work our way up
(define (cont-frac-iterative n d k)
  (define (cont-frac-iter n d i accum)
    (if (= i 0)
        accum
        (cont-frac-iter n d (- i 1) (/ (n i) (+ (d i) accum)))))
  (cont-frac-iter n d (- k 1) (/ (n k) (d k))))

(define (d i)
  (if (= (remainder i 3) 2)
      (* 2 (/ (+ i 1) 3))
      1))

; Try the series for e, and verify if log(e)=1
(define e (+ 2 (cont-frac-iterative (lambda (i) 1.0) d 12)))
e
(log e)