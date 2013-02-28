#lang planet neil/sicp
;SICP 2.40
(define (accumulate op initial sequence)
  (if (null? sequence) 
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval i j)
  (if (> i j)
      nil
      (cons i (enumerate-interval (+ i 1) j))))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(define (prime? x)
  (define (prime-iter i x)
    (cond ((> (* i i) x) true)
          ((= 0 (remainder x i)) false)
          (else (prime-iter (+ i 1) x))))
  (prime-iter 2 x))

(define (filter predicate sequence)
  (if (null? sequence)
      nil
      (if (predicate (car sequence))
          (cons (car sequence)
                (filter predicate (cdr sequence)))
          (filter predicate (cdr sequence)))))

(display (prime-sum-pairs 5))


