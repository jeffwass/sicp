#lang planet neil/sicp
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 2 4)
(a-plus-abs-b 2 -4)