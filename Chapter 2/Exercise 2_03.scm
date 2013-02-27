#lang planet neil/sicp
;SICP 2.02
(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Rectangle defined by corner vertices
(define (make-rect-v p1 p2)
  (let ((x1 (x-point p1))
        (y1 (y-point p1))
        (x2 (x-point p2))
        (y2 (y-point p2)))
    (cons "v" (cons (make-point (min x1 x2) (max y1 y2)) (make-point (max x1 x2) (min y1 y2))))))
(define (upper-left-v rect)
  (car (cdr rect)))
(define (lower-right-v rect)
  (cdr (cdr rect)))


; Rectangle defined by center point, and full width/height
(define (make-rect-cp c w h)
  (cons "cp" (cons c (cons w h))))
(define (upper-left-cp rect)
  (let ((c (car (cdr rect)))
        (w (car (cdr (cdr rect))))
        (h (cdr (cdr (cdr rect)))))
    (make-point (- (x-point c) (/ w 2)) (+ (y-point c) (/ h 2)))))
(define (lower-right-cp rect)
  (let ((c (car (cdr rect)))
        (w (car (cdr (cdr rect))))
        (h (cdr (cdr (cdr rect)))))
    (make-point (+ (x-point c) (/ w 2)) (- (y-point c) (/ h 2)))))

; Generic Perimeter + Area selectors
(define (upper-left rect)
  (if (equal? (car rect) "v") (upper-left-v rect) (upper-left-cp rect)))
(define (lower-right rect)
  (if (equal? (car rect) "v") (lower-right-v rect) (lower-right-cp rect)))

(define (area rect)
  (let ((ul (upper-left rect))
        (lr (lower-right rect)))
    (* (- (x-point lr) (x-point ul)) (- (y-point ul) (y-point lr)))))
(define (perimeter rect)
  (let ((ul (upper-left rect))
        (lr (lower-right rect)))
    (* 2 (+ (- (x-point lr) (x-point ul)) (- (y-point ul) (y-point lr))))))


; Define the same rectangle 3 ways (twice by different vertices, once by center point)
(define rect1 (make-rect-v (make-point 2 9) (make-point 4 -1)))
(define rect2 (make-rect-v (make-point 2 -1) (make-point 4 9)))
(define rect3 (make-rect-cp (make-point 3 4) 2 10))

; Print the upper-left point of all three rectangles (using the same abstracted procedure)
(print-point (upper-left rect1))
(print-point (upper-left rect2))    
(print-point (upper-left rect3))
(newline)

; Print the area and perimeter
(newline)(display (area rect1))
(newline)(display (area rect2))
(newline)(display (area rect3))
(newline)
(newline)(display (perimeter rect1))
(newline)(display (perimeter rect2))
(newline)(display (perimeter rect3))

