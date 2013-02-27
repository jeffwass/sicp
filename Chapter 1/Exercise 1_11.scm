#lang planet neil/sicp
(define (f-recursive n) 
  (if(< n 3) n (+ (f-recursive ( - n 1)) (* 2 (f-recursive ( - n 2))) (* 3 (f-recursive( - n 3))))))


  (define (f fn-1 fn-2 fn-3) (+ fn-1 (* 2 fn-2) (* 3 fn-3)))
  (define (f-iter n-cum n-tot fn-1 fn-2 fn-3) 
    (cond ((= n-cum n-tot) (f fn-1 fn-2 fn-3))
          (else (f-iter (+ n-cum 1) n-tot (f fn-1 fn-2 fn-3) fn-1 fn-2))))
(define (f-iterative n)
  (cond ((< n 3) n)
        (else (f-iter 3 n 2 1 0))))

  