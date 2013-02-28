#lang planet neil/sicp
;SICP 2.41
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

(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j) 
                    (map (lambda (k) (list i j k))
                    (enumerate-interval 1 (- j 1))))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))


(define (filter predicate sequence)
  (if (null? sequence)
      nil
      (if (predicate (car sequence))
          (cons (car sequence)
                (filter predicate (cdr sequence)))
          (filter predicate (cdr sequence)))))

(define (find-the-triples s n)
  (filter (lambda (x) (<= (+ (car x) (cadr x) (caddr x)) s)) (unique-triples n)))

(display (find-the-triples 8 10))
