#lang planet neil/sicp
; SICM 2.42

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row
                                    k
                                    rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (filter predicate sequence)
  (if (null? sequence)
      nil
      (if (predicate (car sequence))
          (cons (car sequence)
                (filter predicate (cdr sequence)))
          (filter predicate (cdr sequence)))))

(define (flatmap proc seq) (accumulate append nil (map proc seq)))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))

(define (enumerate-interval i j)
  (if (> i j)
      nil
      (cons i (enumerate-interval (+ i 1) j))))

(define empty-board nil)

(define (print-positions positions)
  (map print-position positions))

(define (print-position position)
  (map (lambda (row) (display row) (newline)) position)
  (newline))

; New position is always first for easy retrieval
(define (adjoin-position new-row k rest-of-queens)
  (append (list (list new-row k)) rest-of-queens))

(define (safe? k positions)
  (define ret (cond
                ((contains? (map (lambda (pos) (car pos)) (cdr positions)) (caar positions)) 1)
                ((contains? (map (lambda (pos) (+ (car pos) (cadr pos))) (cdr positions)) (+ (caar positions) k)) 2)
                ((contains? (map (lambda (pos) (- (car pos) (cadr pos))) (cdr positions)) (- (caar positions) k)) 3)
                (else 0)))
  (if (= ret 0) true false))

(define (contains? the-list el)
  (cond ((null? the-list) false)
        ((= el (car the-list)) true)
        (else (contains? (cdr the-list) el))))

(define eight-queens (queens 8))
(display "Number of solutions for 8 queens: ")(length eight-queens)(newline)
(display "(row/col) pairs for one solutions: ")(newline)
(print-position (car eight-queens))
;(print-positions eight-queens)