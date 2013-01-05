#lang planet neil/sicp
; SICP 1.44
(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1))))) 
(define (compose f g)
  (lambda (x) (f (g x))))
(define (square x) (* x x))

(define (smooth f dx) 
  (lambda (x) (/ (+ (f (+ x dx)) (f x) (f (- x dx))) 3)))
(define (smooth-n f dx n) 
  (repeated (smooth f dx) n))

(sqrt 0.5)
(newline)

;Smooth Sqrt(0.5) and Sqrt(1.5).
;We expect both to converge to unity (repeated square roots bring us closer to 1)
(define (printloop x n end)
 (display n)(display " ")(display ((smooth-n sqrt 0.0001 n) x))(newline)
 (if (= n end) 
     "done"
     (printloop x (+ n 1) end)))
(printloop 0.5 1 10)
(printloop 1.5 1 10)
                                  