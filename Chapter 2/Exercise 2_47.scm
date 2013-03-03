#lang planet neil/sicp
; SICP 2.47

(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame1 frame)
  (car frame))
(define (edge1-frame1 frame)
  (cadr frame))
(define (edge2-frame1 frame)
  (caddr frame))

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin-frame2 frame)
  (car frame))
(define (edge1-frame2 frame)
  (cadr frame))
(define (edge2-frame2 frame)
  (cddr frame))

(define f1 (make-frame1 'a 'b 'c))
(display f1)(newline)
(origin-frame1 f1)
(edge1-frame1 f1)
(edge2-frame1 f1)

(newline)
(define f2 (make-frame2 'a 'b 'c))
(display f2)(newline)
(origin-frame2 f2)
(edge1-frame2 f2)
(edge2-frame2 f2)
